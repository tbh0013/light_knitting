<?php

require_once '../initiallization.php';

$posts['name'] = htmlspecialchars($_POST['name'], ENT_QUOTES, 'utf-8');
$posts['price'] = htmlspecialchars($_POST['price'], ENT_QUOTES, 'utf-8');
$posts['category'] = htmlspecialchars($_POST['category'], ENT_QUOTES, 'utf-8');
$posts['image_path'] = htmlspecialchars($_POST['image_path'], ENT_QUOTES, 'utf-8');
$posts['sub_image_path'] = htmlspecialchars($_POST['sub_image_path'], ENT_QUOTES, 'utf-8');
$posts['description'] = htmlspecialchars($_POST['description'], ENT_QUOTES, 'utf-8');
$posts['is_line_up'] = htmlspecialchars($_POST['is_line_up'], ENT_QUOTES, 'utf-8');


if($_FILES['image_path']['name'] !== ""){
    if (is_uploaded_file($_FILES["image_path"]["tmp_name"])) {
        $main_file_name = date('YmdHis')."_".$_FILES["image_path"]["name"];

        if (pathinfo($main_file_name, PATHINFO_EXTENSION) == 'jpg' || pathinfo($main_file_name, PATHINFO_EXTENSION) == 'png') {
            $main_file_tmp_name = $_FILES["image_path"]["tmp_name"];
                if (move_uploaded_file($main_file_tmp_name, "../img/" .$main_file_name)) {
                    echo "メイン画像アップロード完了";
                } else {
                    array_push($errors, '※メイン画像をアップロードできませんでした。');
                }
            } else {
                array_push($errors,'※メイン画像のファイル形式はjpg/pngのみです。');
            }
    } else {
        array_push($errors, '※メイン画像の登録ができませんでした。');
    }
}

if($_FILES['sub_image_path']['name'] !== ""){
    if (is_uploaded_file($_FILES["sub_image_path"]["tmp_name"])) {
        $sub_file_name = date('YmdHis')."_".$_FILES["sub_image_path"]["name"];

        if (pathinfo($sub_file_name, PATHINFO_EXTENSION) == 'jpg' || pathinfo($sub_file_name, PATHINFO_EXTENSION) == 'png') {
            $sub_file_tmp_name = $_FILES["sub_image_path"]["tmp_name"];
            if (move_uploaded_file($sub_file_tmp_name, "../img/" .$sub_file_name)) {
                echo "サブ画像アップロード完了";
            } else {
                array_push($errors, '※サブ画像をアップロードできませんでした。');
            }
        } else {
            array_push($errors, '※サブ画像のファイル形式はjpg/pngのみです。');
        }
    } else {
        array_push($errors, '※サブ画像の登録ができませんでした。');
    }
}

$name_limit = 20;
$name_length = strlen($posts['name']);

if ($name_limit < $name_length) {
    array_push($errors, '※商品名は20文字以内で入力してください');
}

$description_limit = 50;
$description_length = strlen($posts['description']);
if ($description_limit < $description_length) {
    array_push($errors, '※商品説明は50文字以内で入力してください');
}

if (!preg_match('/^([0-1]{1})$/',$posts['is_line_up'])) {
    array_push($errors, '※ラインナップフラグを正しく入力してください');
}
$_SESSION['flash']['errors'] = $errors;
if (empty($errors)) {
    $product_st = $pdo->prepare("INSERT INTO products(name, price, category_id, image_path, sub_image_path, description, is_line_up)VALUES(:name, :price, :category, :image_path, :sub_image_path, :description, :is_line_up)");
    $product_st->bindParam(':name', $posts['name']);
    $product_st->bindParam(':price', $posts['price']);
    $product_st->bindParam(':category', $posts['category']);
    $product_st->bindParam(':image_path', $main_file_name);
    $product_st->bindParam(':sub_image_path', $sub_file_name);
    $product_st->bindParam(':description', $posts['description']);
    $product_st->bindParam(':is_line_up', $posts['is_line_up']);
    $product_st->execute();
    header('location: product_list.php');
    exit();
} else {
    header("location: create_product.php");
    exit();
}


