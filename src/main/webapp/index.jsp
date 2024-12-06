<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="index.css" rel="stylesheet">
    <title>Login - Clothing Store</title>
    <style>
        /* Center content vertically and horizontally */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Card Design for the Login Form */
        .card {
            padding: 30px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #ffffff;
        }

        .card h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-control {
            border-radius: 8px;
            padding: 15px;
        }

        .btn-primary {
            background-color: #007bff;
            border-radius: 8px;
            padding: 15px;
            font-size: 1rem;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .text-center a {
            font-size: 1rem;
            color: #007bff;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        /* Background and Padding */
        body {
            background: url('https://cdn.pixabay.com/photo/2024/02/06/16/59/paper-bag-8557551_1280.jpg') no-repeat center center fixed;
            background-size: cover;
            padding: 0;
            margin: 0;
        }

        .header-text {
            font-size: 2.5rem;
            font-weight: bold;
            color: white;
            text-align: center;
            margin-bottom: 20px;
        }

        .sub-header {
            font-size: 1.25rem;
            color: white;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Responsive Design for smaller screens */
        @media (max-width: 768px) {
            .card {
                padding: 20px;
                width: 90%;
            }

            .header-text, .sub-header {
                font-size: 1.8rem;
            }
        }

        /* Slogan Style */
        .slogan {
            font-size: 2rem;
            color: white;
            text-align: center;
            font-weight: bold;
            margin-top: 50px;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center flex-column vh-100 bg-light">

    <!-- Slogan Section -->
    <div class="slogan">
        "Discover Fashion, Embrace Your Style!"
    </div>

    <div class="card shadow-lg p-4" style="max-width: 400px; width: 100%;">
        <h2 class="text-center mb-4">Login</h2>
        <form method="post" action="login" name="flogin">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter username" value="user1">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" value="1">
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="register" class="text-decoration-none">Don't have an account? Register</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
