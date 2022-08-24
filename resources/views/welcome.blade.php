<!doctype html>
<html style="height: 100%" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <title>Document</title>
    <style>
        .card:hover {
            cursor: pointer;
            transform: scale(1.1);
        }
    </style>
</head>
<body style="height: 100%">
@include('search')
@yield('content')
<script type="text/javascript">
    setTimeout(function () {
        document.getElementById("alert").remove();
    }, 3000)
</script>
</body>
</html>
