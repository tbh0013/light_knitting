<?php

require_once '../initiallization.php';

$errors = isset($_SESSION['flash']['errors'])
            ? $_SESSION['flash']['errors']
            : array();
unset($_SESSION['flash']['errors']);

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width",initial-scale="1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
        <title>ニュース追加</title>
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
                    <h2 class="text-center mt-3">ニュース追加</h2>
                    <div class="container d-flex justify-content-between">
                        <button onclick="location.href = '../index.php'" class="mt-3">ページトップ</button>
                        <button onclick="location.href = 'news_list.php'" class="mt-3">ニュース一覧に戻る</button>
                    </div>
                    <?php if (!empty($errors)) : ?>
                        <?php foreach ($errors as $error) : ?>
                            <?php echo "<span class=\"error\" style=\"color: red;\">{$error}</span><br>"; ?>
                        <?php endforeach; ?>
                    <?php endif; ?>
                    <form action="storage_news.php" method="POST" enctype="multipart/form-data">
                        <div class="form_item mb-3">
                            <p class="mb-0">商品ID</p>
                            <input type="text" name="product_id" class="w-100">
                        </div>
                        <div class="form_item mb-3">
                            <p class="mb-0">お知らせ日</p>
                            <input type="text" name="date" class="w-100">
                        </div>
                        <div class="form_item mb-3">
                            <p class="mb-0">タイトル</p>
                            <input type="text" name="title" placeholder="20文字以内で入力してください。" class="w-100">
                        </div>
                        <div class="form_item mb-3">
                            <p class="mb-0">本文</p>
                            <textarea name="text" placeholder="50文字以内で入力してください。" class="w-100"></textarea>
                        </div>
                        <div class="form_item mb-3">
                            <p class="mb-0">画像ファイル</p>
                            <input type="file" name="image_path" class="w-100">
                        </div>
                        <div class="form_item mb-3">
                            <p class="mb-0">URL</p>
                            <input type="text" name="url" class="w-100">
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