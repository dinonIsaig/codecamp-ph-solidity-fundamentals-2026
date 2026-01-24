# Bộ Bài Tập Thực Hành Solidity – Từ Cơ Bản Đến Nâng Cao

Bộ sưu tập 6 bài tập được thiết kế dành riêng cho người mới bắt đầu học Solidity. Các bài được sắp xếp theo **độ khó tăng dần** giúp bạn nắm chắc từng khái niệm một cách tự nhiên và vững chắc nhất.

---

## Lộ Trình Học (Nên làm lần lượt từ 1 → 6)

1. [**AddressBook**](./contracts/01_AddressBook.sol)  
   Danh bạ địa chỉ: làm quen với `mapping`, mảng động, `push`, `delete`, và so sánh string bằng `keccak256`.

2. [**TokenTransfer**](./contracts/02_TokenTransfer.sol)  
   Tạo token cơ bản có quyền mint chỉ dành cho owner – học pattern `owner` và chuyển token đơn giản.

3. [**SimpleBank**](./contracts/03_SimpleBank.sol)  
   Ngân hàng đơn giản: nạp tiền, rút tiền, xem số dư – làm quen với `payable` và quản lý ETH.

4. [**SimpleToken**](./contracts/04_SimpleToken.sol)  
   Viết token ERC-20 cơ bản hoàn chỉnh: `transfer`, `approve`, `transferFrom`, `allowance` và các `event`.

5. [**Election**](./contracts/05_Election.sol)  
   Hệ thống bầu cử: thêm ứng cử viên, bỏ phiếu 1 lần/người, tìm người thắng (hỗ trợ trường hợp hòa), sử dụng `modifier` và `event`.

6. [**Lottery**](./contracts/06_Lottery.sol)  
   Xổ số tự động: mua vé theo giá cố định, hết thời gian thì owner chọn ngẫu nhiên người thắng bằng `keccak256` + `block.prevrandao`, sau đó reset vòng mới.

---

### Hướng dẫn sử dụng

- Mỗi file chỉ chứa **khung code + các dòng `// TODO`** rõ ràng, **hoàn toàn không có đáp án**.
- Nên dùng **[Remix IDE](https://remix.ethereum.org)** để code và test nhanh nhất.
- Hãy làm đúng thứ tự **1 → 6** để tránh bị hổng kiến thức.
- Chỉ xem đáp án khi bạn đã **tự viết xong và chạy test thành công**.
- Hoàn thành cả 6 bài = bạn đã nắm đủ nền tảng để **tự viết hầu hết các smart contract cơ bản đến trung cấp**!

Chúc bạn học Solidity thật vui và sớm deploy contract đầu tay lên mainnet! 🚀
Tác giả: Phan Đức 

---

## Code Overview (This Folder)

- `01_AddressBook.sol`: address book with per-user entries and search/remove.
- `02_TokenTransfer.sol`: owner-minted token with basic transfer.
- `03_SimpleBank.sol`: simple ETH bank with deposit/withdraw.
- `04_SimpleToken.sol`: ERC-20 style token skeleton.
- `05_Election.sol`: candidate voting system with winners.
- `06_Lottery.sol`: timed lottery with ticket purchase and winner pick.