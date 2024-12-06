<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="index.css" rel="stylesheet">
    <title>Register - Clothing Store</title>
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
        #toast_ {
		  position: fixed;
		  top: 32px;
		  right: 32px;
		  z-index: 999999;
		}
		
		.toast_ {
		  display: flex;
		  align-items: center;
		  background-color: #fff;
		  border-radius: 2px;
		  padding: 20px 0;
		  min-width: 400px;
		  max-width: 450px;
		  border-left: 4px solid;
		  box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
		  transition: all linear 0.3s;
		}
		
		@keyframes slideInLeft {
		  from {
		    opacity: 0;
		    transform: translateX(calc(100% + 32px));
		  }
		  to {
		    opacity: 1;
		    transform: translateX(0);
		  }
		}
		
		@keyframes fadeOut {
		  to {
		    opacity: 0;
		  }
		}
		
		.toast--success {
		  border-color: #47d864;
		}
		
		.toast--success .toast__icon {
		  color: #47d864;
		}
		
		.toast--info {
		  border-color: #2f86eb;
		}
		
		.toast--info .toast__icon {
		  color: #2f86eb;
		}
		
		.toast--warning {
		  border-color: #ffc021;
		}
		
		.toast--warning .toast__icon {
		  color: #ffc021;
		}
		
		.toast--error {
		  border-color: #ff623d;
		}
		
		.toast--error .toast__icon {
		  color: #ff623d;
		}
		
		.toast_ + .toast_ {
		  margin-top: 24px;
		}
		
		.toast__icon {
		  font-size: 24px;
		}
		
		.toast__icon,
		.toast__close {
		  padding: 0 16px;
		}
		
		.toast__body {
		  flex-grow: 1;
		}
		
		.toast__title {
		  font-size: 16px;
		  font-weight: 600;
		  color: #333;
		}
		
		.toast__msg {
		  font-size: 14px;
		  color: #888;
		  margin-top: 6px;
		  line-height: 1.5;
		}
		
		.toast__close {
		  font-size: 20px;
		  color: rgba(0, 0, 0, 0.3);
		  cursor: pointer;
		}
    </style>
</head>
<body class="d-flex justify-content-center align-items-center flex-column vh-100 bg-light">
	<div id="toast_"></div>
    <!-- Slogan Section -->
    <div class="slogan">
        "Discover Fashion, Embrace Your Style!"
    </div>

    <div class="card shadow-lg p-4" style="max-width: 400px; width: 100%;">
        <h2 class="text-center mb-4">Register</h2>
        <form method="post" onsubmit="return handleFormSubmit(event)" name="flogin">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter username">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter password">
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="/WebBanAo" class="text-decoration-none">I have an account? Login</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="./views/RegisterPage/RegisterPage.js"></script>
    <script>
	    function handleFormSubmit(event) {
	        event.preventDefault(); // Ngăn form gửi đi
	        register(); // Gọi hàm xử lý đăng ký
	    }
	    function register() {
	    	const uname = document.getElementById('username').value;
	    	const pass = document.getElementById('password').value;
	        $.ajax({
	            type: "POST",
	            url: "/WebBanAo/register", // Đường dẫn của Servlet
	            data: { username : uname,
	            	    password : pass},
	            success: function(response) {
	            	showSuccessToast(response.message +"\n tự chuyển đến trang login sau 3s");
	            	setTimeout(function() {
	                    window.location.href = "/WebBanAo"; // Thay đổi URL nếu cần
	                }, 3000);
	            },
	            error: function(xhr) {
	            	const errorResponse = JSON.parse(xhr.responseText);
	                console.error("Error: " + errorResponse.error);
	                showErrorToast(errorResponse.error);
	            }
	        });
	    }
    </script>
</body>
</html>