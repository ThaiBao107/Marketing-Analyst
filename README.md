# Marketing-Analyst
> Trong các nhánh của marketing analytics, digital marketing analytics là mảng có tốc độ tăng
trưởng dữ liệu nhanh nhất và mức độ đo lường trực tiếp cao nhất. Marketing truyền thống chỉ
ước lượng hiệu quả một cách gián tiếp qua khảo sát hoặc doanh số tổng. Digital marketing đo
lường được toàn bộ hành trình khách hàng, từ lần hiển thị quảng cáo đầu tiên đến khi thanh
toán, với độ phân giải đến từng chiến dịch, từng kênh, từng phân khúc đối tượng.

**Câu hỏi kinh doanh:** 
> Trong năm vừa qua, ba thương hiệu của chúng ta đã chi hàng chục nghìn chiến dịch trên nhiều
nền tảng. Vậy tiền đó có đang được dùng đúng chỗ không, và năm tới nên phân bổ thế nào? \
> Thương hiệu nào đang tạo ra lợi nhuận tốt nhất trên cùng một đồng ngân sách bỏ ra? Sự
chênh lệch đó đến từ đâu? \
> Loại chiến dịch nào và kênh nào đang hoạt động hiệu quả nhất? Mỗi thương hiệu có điểm
mạnh riêng ở loại hình nào? \
> Nếu ngân sách năm tới tăng thêm, nên ưu tiên thương hiệu nào, kênh nào, loại chiến dịch
nào để tối đa hóa lợi nhuận?

**Vai trò:** Data Analyst \
**Công cụ:** PostgreSQL, Google Sheet, Power BI

## 1. Dữ liệu

| | |
| --- | --- |
| Phạm vi | Từ tháng 07/2024 - 06/2025  |
| Số lượng dòng | 166.665K |
| Số lượng cột | 22 cột (Campaign Type, Brand, Target Audience, Duration, Channel Used, Impressions, Clicks, Leads, Conversions, CTR, Conversion Rate (CRV), Acquisition cost (CPA), Weighted ROI, Revenue_Per_Conversion (AOV), CPC, CVR, Total Spend, Customer Segment, Campaign Date, Primary Channel, Duration Group, ROI Category |
| Đặc điểm | Dự liệu được tổng hợp từ 3 brand: Nykaa, Purplle, Tira Beauty |

**Xử lý dữ liệu**
- Kiểm tra chất lượng: Xử lý 600 giá trị NULL, 150 dòng bị trùng lặp.
- Tính KPIs tổng quan ban đầu.

## 2. Phân tích
### 2.1 Phân tích về Brand
![Overview](./Marketing%20Analyst/Image/brand.png)
- Có thể thấy khi phân tích 3 Brand (Nykaa, Purplle, Tira Beauty), trong đó Purplle có Weighted ROI cao và Weighted_CPA lần lượt là 1.94 và 170.10. Với chỉ số này có thể thấy được so với 2 brand còn lại là Nykaa, Tira Beauty thì Purplle sẽ cho ra hiểu quả cao về mặt quảng cáo cao hơn và đáng để suy nghĩ có nên đầu tư vào nhiều hơn không.
- Với Nykaa là brand cho ra Weighted_ROI và Weighted_CPA là 1.65 và 169.03. Có thể thấy rằng mức chi phí đầu tư đưa ở cả 3 brand sẽ không chênh lệch quá cao, nhưng Nykaa lại cho ra tỷ lệ hoàn vốn Weighted_ROI thấp hơn so với 2 brand còn lại.
### 2.2 Phân tích về Campaign Type
![Overview](./Marketing%20Analyst/Image/CampaignType.png)
- Có 5 loại Campaign Type là Paid Ads, Social Media, Email, SEO, Influencer. Có thể thấy được Paid Ads cho Weighted ROI và Weighted CPA là 1.86 và 169.28, với những chỉ số này cho thấy rằng Paid Ads có tỷ lệ hoàn vốn cao và chí phí đầu tư lại thấp.
- Bên cạnh đó thì Influence lại cho ra Weighted_ROI và Weighted_CPA lần lượt là 1.81 và 170.70, có thể thấy Influence đang cho ra tỷ lệ hoàn vốn thấp nhất trong 5 loại chiến dịch và cũng tiêu nhiều chi phí quảng cáo hơn. Nhìn chung với Influence chưa thể đánh giá kém hiệu quả hơn với những loại chiến dịch còn lại.
### 2.3 Phân tích về thế mạnh của các loại chiến dịch ở các brand 
![Overview](./Marketing%20Analyst/Image/Brand_Campaign.png)
- Với Purplle sẽ có Weighted ROI cao ở các loại chiến dịch Social Media (1.96), Paid Ads (1.96), Email (1.95).
- Với Tira Beauty sẽ có Weighted ROI cao ở các loại chiến dịch Paid Ads (1.97), Email (1.94).
- Với Nykaa sẽ có Weighted ROI cao ở các loại chiến dịch SEO (1.68), Social Media (1.68).
- Có thể thấy được rằng mỗi brand sẽ có có thể mạnh về các loại chiến dịch riêng của từng brand, việc lựa chọn đầu tư vào loại chiến dịch của một brand cần phải xem xét thật kỹ ở Weighted_ROI và Weighted_CPA. \\
![Overview](./Marketing%20Analyst/Image/DurationGroup.png)
- Khi phân tích về tổng số thời gian diễn ra của các loại chiến dịch dựa trên Duration Group thì có thể thấy Medium (8-14 days), Long (15-21 days) sẽ là khoảng thời cho ra Weighted ROI cao là 1.86 và 1.85. Có thể kết luận gần từ 8 đến 21 ngày sẽ là khoảng thời gian để một chiến dịch được triển khai là hợp lý nhất. 
### 2.4 Phân tích về kênh
![Overview](./Marketing%20Analyst/Image/Channel.png)
- Ở đây có thể thấy được Instagram có Weighted ROI và Weighted CPA là 1.87 và 168.75, Email có Weighted ROI và Weighted CPA là 1.86 và 168.69. Hai kênh này đang tạo ra được lợi thế rất cao về lợi nhuận và chí phí đầu tư lại thấp, có thể xem xét phân phối đầu tư vào 2 kênh này. Tuy nhiên, do chênh lệch giữa các kênh không lớn, quyết định cuối cùng vẫn cần được đối chiếu thêm với loại campaign, thương hiệu và quy mô ngân sách.
- Với Facebook, Google, WhatsApp, Youtube có Weighted ROI từ 1.82 đến 1.83 và Weighted CPA sẽ dao động từ 169.68 đến 170.65, có thể thấy được 3 kênh này chưa thể tối ưu hiệu quả về chí phí đầu tư và chi phí đầu từ còn khá cao.
### 2.5 Phân tích về phân phối ROI
![Overview](./Marketing%20Analyst/Image/ROI_Dis.png)
- Có thể thấy với nhóm Poor khá cao và chiếm đến 23.97% (gần 1/4 ROI) về tỷ lệ hoàn vốn. Cần phải xem xét thật kỹ về nhóm Poor để khắc phục tình trạng. Điều này đồng nghĩa với việc gần một phần tư ngân sách đang được chi cho các hoạt động không tạo ra lợi nhuận.
- Ở chiều ngược lại, khoảng 39,2% campaign thuộc nhóm Excellent và Good đang hoạt động hiệu quả với ROI lớn hơn 2.
### 2.6 Phân tích về theo thời gian
![Overview](./Marketing%20Analyst/Image/TimeTrend.png)
- Ở đây có thể thấy được gần với Quý 1 - 2025 thì sẽ cho ra Weighted_ROI cao ở cả 3 brand Nykaa, Tira Beauty, Purplle lần lượt là 1.65, 1.96, 1.96. Có thể thấy đây sẽ khoảng thời gian nên được ưu tiên đầu tư chi phí vào nhất. Quý 1 -2025 sẽ là giai đoạn khách hàng có sẵn sàng mua hàng cao (New Year resolution, khởi đầu năm mới).
- Bên cạnh đó với Quý 2 - 2025 thì lại cho ra Weighted_ROI thấp ở 3 brand Nykaa, Tira Beauty, Purplle lần lượt là 1.62, 1.88, 1.93. Q2-2025 có thể đối mặt với cạnh tranh cao hoặc nhu cầu thấp hơn, làm tăng chi phí chuyển đổi.
## 3. Trực quan hóa
- Dashboard được xây dựng từ Power BI, dashboard sẽ bao gồm 5 page (Overview, Campaign Performance, Channel Analyst, Audience & Segment, Cost & ROI)
### 3.1 Data Model
![Overview](./Marketing%20Analyst/Image/Data_model.png)
- Trong data model gồm 1 bảng fact (FactMarketing) và 10 bảng dimension (DimChannelUsed, DimBrand, DimCustomerSegment, DimDate, DimDurationGroup, DimTargetAudience, DimPrimaryChannel, DimRegion, DimRoiCategory, DimCampaignType)
### 3.2 Page
#### 3.2.1 Overview Page
![Overview](./Marketing%20Analyst/Image/Overview_Page.png)
#### 3.2.1 Campaign Performance Page
![Overview](./Marketing%20Analyst/Image/Campaign_Page.png)
#### 3.2.1 Channel Analyst Page
![Overview](./Marketing%20Analyst/Image/Channel_Page.png)
#### 3.2.1 Audience & Segment Page
![Overview](./Marketing%20Analyst/Image/Audience_page.png)
#### 3.2.1 Cost & ROI Page
![Overview](./Marketing%20Analyst/Image/ROI_page.png)


## Cấu trúc repository

| Tệp | Nội dung |
| --- | --- |
| `Marketing_Analyst.pbix` | Chứa Marketing Analyst Dashboard, bao gồm 5 page |
| `Scripts_Marketing_Analyst.sql` | Bao gồm các lệnh SQL về EDA trên dữ liệu và thống kế ban đầu |


---
