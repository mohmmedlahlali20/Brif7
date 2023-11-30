<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Display</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    body {
        padding: 20px;
        background-color: #f8f9fa;
    }

    .product-card {
        border: 1px solid #dee2e6;
        border-radius: 8px;
        overflow: hidden;
        transition: transform 0.2s;
    }

    .product-card:hover {
        transform: scale(1.05);
    }

    .product-img {
        height: 200px;
        object-fit: cover;
    }

    .card-body {
        padding: 1.25rem;
    }

    .card-title {
        font-size: 1.25rem;
        font-weight: bold;
        margin-bottom: 0.75rem;
    }

    .card-text {
        color: #6c757d;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    </style>
</head>

<body>

    <div class="container">
        <h2 class="mt-5 mb-4">Product Display</h2>

        <div class="row">
            <!-- Product Card -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card product-card">
                    <img src="https://placehold.it/300x200" class="card-img-top product-img" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title">Product Name</h5>
                        <p class="card-text">Product Description goes here.</p>
                        <p class="card-text">Price: $XX.XX</p>
                        <a href="#" class="btn btn-primary">Add to Cart</a>
                    </div>
                </div>
            </div>
            <!-- Repeat the above card structure for each product -->

            <!-- Add more product cards as needed -->
        </div>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>