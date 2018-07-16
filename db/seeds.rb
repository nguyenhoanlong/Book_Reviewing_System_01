User.create!(
  name: "Nguyen Hoan Long",
  email: "nguyen.hoan.long@framgia.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  activated: true,
)

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    activated: true)
end

Category.create!(
  title: "Lịch sử Việt Nam",
  description: "Lịch sử là một khoa học luôn chỉnh sửa lại mình trên cơ 
    sở những phát hiện mới của khảo cổ, hoặc từ những tư liệu lịch sử bị
    lãng quên, bị thất lạc, bị che giấu vì những lý do xã hội nào đó, tới
    nay mới có điều kiện lộ sáng. Với những quyển sách hay về lịch sử Việt Nam sau đây,
    chúng tôi mong rằng bạn sẽ thỏa niềm đam mê tìm tòi và 
    thêm tự hào với những thăng trầm mà dân tộc Việt Nam đã kinh qua."
)

Category.create!(
  title: "Lập trình",
  description: "Chúng ta có rất nhiều tài liệu lập trình
   có sẵn miễn phí trên internet. Tuy nhiên, khi bạn bắt đầu học từ internet,
   thì thông tin ở đó có thể khiến bạn đi chệch hướng và chúng không thể chứa 
   tất cả các chủ đề chi tiết như những cuốn sách được. Khi học lập trình qua sách bạn
   cũng sẽ tập trung hơn và không gặp phải những yếu tố phân tâm sao lãng.."
)

Category.create!(
  title: "Thiểu thuyết văn học",
  description: "Văn học là dòng sách có nhiều đọc giả nhất trên thế giới, 
  nhiều giải thưởng lớn như Pulitzer , Goncourt, Nobel phần lớn là những tựa văn
  học đình đám từ nhiều tác gia trên thế giới. Điều này đủ thấy sức ảnh hưởng và giá 
  trị truyền tải của những quyển sách văn học, đặc biệt văn học nước ngoài là vô cùng lớn."
)
