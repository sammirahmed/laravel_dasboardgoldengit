<?php

use App\Models\ProductReviews;
use App\Repositories\ProductReviewsRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class ProductReviewsRepositoryTest extends TestCase
{
    use MakeProductReviewsTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var ProductReviewsRepository
     */
    protected $productReviewsRepo;

    public function setUp()
    {
        parent::setUp();
        $this->productReviewsRepo = App::make(ProductReviewsRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateProductReviews()
    {
        $productReviews = $this->fakeProductReviewsData();
        $createdProductReviews = $this->productReviewsRepo->create($productReviews);
        $createdProductReviews = $createdProductReviews->toArray();
        $this->assertArrayHasKey('id', $createdProductReviews);
        $this->assertNotNull($createdProductReviews['id'], 'Created ProductReviews must have id specified');
        $this->assertNotNull(ProductReviews::find($createdProductReviews['id']), 'ProductReviews with given id must be in DB');
        $this->assertModelData($productReviews, $createdProductReviews);
    }

    /**
     * @test read
     */
    public function testReadProductReviews()
    {
        $productReviews = $this->makeProductReviews();
        $dbProductReviews = $this->productReviewsRepo->find($productReviews->id);
        $dbProductReviews = $dbProductReviews->toArray();
        $this->assertModelData($productReviews->toArray(), $dbProductReviews);
    }

    /**
     * @test update
     */
    public function testUpdateProductReviews()
    {
        $productReviews = $this->makeProductReviews();
        $fakeProductReviews = $this->fakeProductReviewsData();
        $updatedProductReviews = $this->productReviewsRepo->update($fakeProductReviews, $productReviews->id);
        $this->assertModelData($fakeProductReviews, $updatedProductReviews->toArray());
        $dbProductReviews = $this->productReviewsRepo->find($productReviews->id);
        $this->assertModelData($fakeProductReviews, $dbProductReviews->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteProductReviews()
    {
        $productReviews = $this->makeProductReviews();
        $resp = $this->productReviewsRepo->delete($productReviews->id);
        $this->assertTrue($resp);
        $this->assertNull(ProductReviews::find($productReviews->id), 'ProductReviews should not exist in DB');
    }
}
