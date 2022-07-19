<?php

namespace App\Http\Controllers;

use App\DataTables\PostDataTable;
use App\Http\Requests;
use App\Http\Requests\CreatePostRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Repositories\PostRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class PostController extends Controller
{
    /** @var  PostRepository */
    private $postRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(PostRepository $postRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->postRepository = $postRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Post.
     *
     * @param PostDataTable $postDataTable
     * @return Response
     */
    public function index(PostDataTable $postDataTable)
    {
        return $postDataTable->render('posts.index');
    }

    /**
     * Show the form for creating a new Post.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->postRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->postRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('posts.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Post in storage.
     *
     * @param CreatePostRequest $request
     *
     * @return Response
     */
    public function store(CreatePostRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->postRepository->model());
        try {
            $post = $this->postRepository->create($input);
            $post->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.post')]));

        return redirect(route('posts.index'));
    }

    /**
     * Display the specified Post.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $post = $this->postRepository->findWithoutFail($id);

        if (empty($post)) {
            Flash::error('Post not found');

            return redirect(route('posts.index'));
        }

        return view('posts.show')->with('post', $post);
    }

    /**
     * Show the form for editing the specified Post.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $post = $this->postRepository->findWithoutFail($id);
        
        

        if (empty($post)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.post')]));

            return redirect(route('posts.index'));
        }
        $customFieldsValues = $post->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->postRepository->model());
        $hasCustomField = in_array($this->postRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('posts.edit')->with('post', $post)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Post in storage.
     *
     * @param  int              $id
     * @param UpdatePostRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePostRequest $request)
    {
        $post = $this->postRepository->findWithoutFail($id);

        if (empty($post)) {
            Flash::error('Post not found');
            return redirect(route('posts.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->postRepository->model());
        try {
            $post = $this->postRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $post->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.post')]));

        return redirect(route('posts.index'));
    }

    /**
     * Remove the specified Post from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $post = $this->postRepository->findWithoutFail($id);

        if (empty($post)) {
            Flash::error('Post not found');

            return redirect(route('posts.index'));
        }

        $this->postRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.post')]));

        return redirect(route('posts.index'));
    }

        /**
     * Remove Media of Post
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $post = $this->postRepository->findWithoutFail($input['id']);
        try {
            if($post->hasMedia($input['collection'])){
                $post->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
