<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Error Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0XI"
      crossorigin="anonymous">
    <style>
      .error-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      .error-heading {
        font-size: 5rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
      }
      .error-text {
        font-size: 2rem;
        margin-bottom: 2rem;
      }
      .error-link {
        padding: 0.75rem 1.5rem;
        border-radius: 2rem;
        font-size: 1.25rem;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 0.1rem;
      }
      .error-link:hover {
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <div class="error-container">
      <h1 class="error-heading">${message}</h1>
      <a href="/" class="btn btn-primary error-link">Go to homepage</a>
    </div>
  </body>
</html>