# Smart Food Court System Website

Sofware Engineering

Java Servlet and MySQL

Hướng dẫn config:

1. Download source code

2. Sử dụng Eclipse bản Eclipse IDE for Entersprise Java Developers (includes Incubating components)

3. Tải và cài JDK 14.01

4. Import project vào eclipse

5. Chọn properties của SFCS, xác định chuẩn thư viện java của project

6. Chọn Server của SFCS, tìm tới thư mục chứa tomcat

7. Chỉnh sửa lại thông tin cấu hình database trong mục SFCS/src/jdbc

8. Chọn run on server

9. Truy cập vào trang web qua địa chỉ http://localhost:9090/SFCS

* Đây chỉ là hướng dẫn cơ bản, có thể khác nhau trong các phiên bản khác nhau

* Liên hệ email lesonlhld@gmail.com để được hướng dẫn chi tiết hơn

* Tomcat có hỗ trợ share trong lan, bạn chỉ cần xác định ip của máy chạy server (có thể cần sửa firewall hoặc một số thiết lập khác). Ví dụ 192.168.8.108 bằng lệnh ipconfig trong cmd. Sau đó ở các máy khác trong cùng 1 mạng lan, truy cập vào website thông qua địa chỉ http://192.168.8.108:9090/SFCS