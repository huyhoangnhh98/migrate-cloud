# Hướng dẫn triển khai ứng dụng với Helm

## 1. Truy cập vào Bastion dùng để authenticate với cụm Kubernetes tương ứng từng môi trường
Sử dụng lệnh SSH để truy cập vào bastion cho từng môi trường:

### Môi trường Dev
```sh
ssh -i <path/to/key> <dev_account>@<dev_ip>
```

### Môi trường Staging
```sh
ssh -i <path/to/key> <staging_account>@<staging_ip>
```

### Môi trường Prod
```sh
ssh -i <path/to/key> <prod_account>@<prod_ip>
```

## 2. Run deploy trên từng môi trường
### 2.1 Tạo file run.sh dựa theo nội dung trong folder scripts theo từng môi trường tương ứng
```sh
vim dev.sh
```

### 2.2 Cấp phép cho file

```sh
chmod +x dev.sh
```

### 2.3 Run file deploy

```sh
./dev.sh
```

## 3. Kiểm tra thông tin đã deploy
```sh
kubectl get all -n app
```