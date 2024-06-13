# Cách chuyển đổi traffic từ sub domain cũ sang mới

## Phương pháp

Dùng ALB weight policy để chuyển đổi dần traffic

REF: 


## Hiện trạng
3 domain cho 3 môi trường dev, test, staging đều là simple routing đến ALB
Dev: dev.example.com -> ALB 1 -> ECS
Staging: staging.example.com -> ALB 2 -> ECS
Prod: app.example.com -> ALB 3-> ECS

Chuyển traffic từ 3 domain này sang domain mới là simple routing đến ALB
Dev: dev-temp.example.com -> ALB 1 -> EKS
Staging: staging-temp.example.com -> ALB 2 -> EKS
Prod: app-temp.example.com -> ALB 3 -> EKS

## Cách thực hiện
### Update rule của ALB ban đầu 100% trafic đến ECS của sub domain dev
IF host-header == 'dev.example.com'
THEN forward to [ECS target group (weight 100), EKS target group (weight 0)]

### Sau đó thực hiện update dần dần cho subdomain dev chuyển traffic đến target EKS
IF host-header == 'dev.example.com'
THEN forward to [ECS target group (weight 100), EKS target group (weight 0)]

IF host-header == 'dev.example.com'
THEN forward to [ECS target group (weight 75), EKS target group (weight 25)]

IF host-header == 'dev.example.com'
THEN forward to [ECS target group (weight 50), EKS target group (weight 50)]

IF host-header == 'dev.example.com'
THEN forward to [ECS target group (weight 25), EKS target group (weight 75)]

IF host-header == 'dev.example.com'
THEN forward to [ECS target group (weight 0), EKS target group (weight 100)]

### Sau khi tất cả traffic được chuyển qua EKSS, update dsubdomain dev trỏ vào dev-temp.example.com
Vào Route53 chọn subdomain dev.example.com -> chọn alias domain dev-temp.example.com

### Sau đó xoá domain dev.example.com để hoàn tất chuyển đổi