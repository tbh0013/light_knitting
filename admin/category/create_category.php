<?php

require_once '../initiallization.php';

?>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width",initial-scale="1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
        <title>カテゴリー追加</title>
    </head>

    <body>
        <header>
            <div class="container">
                <h1 class="text-center">管理画面</h1>
            </div>
        </header>

        <main style="min-height: 100vh;">
            <div class="wrapper">
                <div class="container">
                    <h2 class="text-center mt-3">カテゴリー追加</h2>
                    <div class="container d-flex justify-content-between">
                        <button onclick="location.href = '../index.php'" class="mt-3">ページトップ</button>
                        <button onclick="location.href = 'category_list.php'" class="mt-3">カテゴリー一覧に戻る</button>
                    </div>

                    <form action="storage_category.php" method="POST">
                        <div class="form_item mb-3">
                            <p class="mb-0">カテゴリー名</p>
                            <input type="text" name="name" class="w-100">
                        </div>
                        <button type="submit" class="mt-3">更新する</button>
                    </form>
                </div>
            </div>
        </main>

        <footer class="container-fluid d-flex justify-content-center align-items-center">
            <p class="m-0">(C)2021 Light Knitting.</p>
        </footer>
    </body>
</html>