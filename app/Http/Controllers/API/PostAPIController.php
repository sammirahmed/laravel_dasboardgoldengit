<?php

namespace App\Http\Controllers\API;


use App\Models\Post;
use App\Repositories\PostRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class PostController
 * @package App\Http\Controllers\API
 */

class PostAPIController extends Controller
{
    /** @var  PostRepository */
    private $postRepository;

    public function __construct(PostRepository $postRepo)
    {
        $this->postRepository = $postRepo;
    }

    /**
     * Display a listing of the Post.
     * GET|HEAD /posts
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->postRepository->pushCriteria(new RequestCriteria($request));
            $this->postRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $posts = $this->postRepository->all();

        return $this->sendResponse($posts->toArray(), 'Posts retrieved successfully');
    }

    /**
     * Display the specified Post.
     * GET|HEAD /posts/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Post $post */
        if (!empty($this->postRepository)) {
            $post = $this->postRepository->findWithoutFail($id);
        }

        if (empty($post)) {
            return $this->sendError('Post not found');
        }

        return $this->sendResponse($post->toArray(), 'Post retrieved successfully');
    }
}
