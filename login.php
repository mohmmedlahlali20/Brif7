<?php
include 'db_cnx.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    $sql = "SELECT * FROM Users WHERE email = '$email' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if ($user["Verified"]) {
            // User is verified, proceed with login
            session_start();
            $_SESSION["customer"] = $user;

            if ($user["Role"] == "admin") {
                header("Location: dashboard.php"); // Redirect to admin dashboard
            } else {
                header("Location: home.php"); // Redirect to product page for regular users
            }

            exit();
        } else {
            // User is not verified, redirect to unverified page
            header("Location: unverified.php");
            exit();
        }
    } else {
        echo "Invalid email or password";
    }
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha256-hk1J8HZqEW/p7zC0xjYYr4EhGtYszmJdz21pKBC7ROU=" crossorigin="anonymous" />
    <style>
        .login {
            min-height: 100vh;
        }

        .bg-image {
            background-image: url('https://source.unsplash.com/WEQbe2jBg40/600x1200');
            background-size: cover;
            background-position: center;
        }

        .login-heading {
            font-weight: 300;
        }

        .btn-login {
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
        }
    </style>
</head>

<body>
    <!-- Start here-->

    <section>
        <div class="container-fluid ps-md-0">
            <div class="row g-0">
                <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
                <div class="col-md-8 col-lg-6">
                    <div class="login d-flex align-items-center py-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-9 col-lg-8 mx-auto">
                                    <h3 class="login-heading mb-4">Welcome back!</h3>

                                    <!-- Sign In Form -->
                                    <form method="post">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
                                            <label for="floatingInput">Email address</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                                            <label for="floatingPassword">Password</label>
                                        </div>

                                        <div class="d-grid">
                                            <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" type="submit">Sign in</button>
                                            <div class="text-center">
                                                <p class="small">You don't have an account ?<a href="?page=register" class=""> Register here</a> </p>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End here-->

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-GLhlTQ8iS6LHs pierced YWR1u7kDToSf5NV9In1EJ+sKtwEVR5EJFdm2i5EG98vUuwjA" crossorigin="anonymous"></script>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>

</body>

</html>