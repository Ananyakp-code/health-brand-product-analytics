## Exploratory Analysis (Excel)
- Initial exploration in Excel showed:
- Balanced acquisition across channels
- Apple Cider Vinegar as top revenue driver
- 51.8% repeat purchase rate
 -Funnel inconsistencies with later stages sometimes exceeding earlier ones
This indicated the need for a **time-based funnel analysis in SQL** to get accurate conversion metrics.<br><br>
  ## SQL Analysis & Key Insights<br>
### Insight 0: Business Health
- **Total customers:** 500  
- **Total revenue:** ₹635,899  
- **Average order value:** ₹757  

**Insight:**  
The platform operates at a mid-range price point, suitable for repeat wellness purchases and subscription-based growth.

---

### Insight 1: Acquisition
- Instagram: **22.4%**
- Google Ads: **22.2%**
- Organic: **20.2%**
- Others: evenly distributed

**Top city:**
- Bangalore: **106 customers**

**Insight:**  
Customer acquisition is evenly distributed across channels, with Instagram and Google Ads contributing the highest share.  
Bangalore leads in signups, indicating stronger demand in tech-centric urban markets.

---

### Insight 2: Revenue Driver

**Top products by revenue:**

| Product | Revenue |
|---------|---------|
| Apple Cider Vinegar | ₹154,500 |
| Ashwagandha | ₹132,402 |
| Diabetes Care | ₹123,030 |
| Skin Foods | ₹115,409 |
| Gut Cleanse | ₹110,558 |

**Insight:**  
Apple Cider Vinegar is the top revenue-generating product, acting as the primary entry-point product.  
Gut Cleanse contributes the least revenue, indicating weaker demand or positioning.

---

### Insight 3: Customer Behaviour
- **Repeat purchase rate:** 51.8%
- **One-time buyers:** 48.2%

**Insight:**  
Over half of customers make repeat purchases, showing moderate to strong product-market fit.  
However, nearly half churn after their first order, highlighting a major retention opportunity.

---

### Insight 4: Funnel Performance (Time-Based SQL Funnel)

**Conversion rates:**
- View → Cart: **89.8%**
- Cart → Checkout: **99.0%**
- Checkout → Purchase: **97.8%**

**Insight:**  
The largest drop occurs at the **view-to-cart stage**, where about 10% of users exit.  
Once users add items to the cart, they almost always complete the purchase.

This indicates:
- Strong purchase intent
- Low checkout friction
- Main opportunity lies in product page optimization

---

### Insight 5: Subscription Opportunity

**Average LTV:**

| Customer Type | Avg LTV |
|---------------|---------|
| Non-subscribers | ₹1,178 |
| Subscribers | ₹1,412 |

Subscribers generate **~20% higher LTV**.

**Insight:**  
Converting first-time buyers into subscribers presents a strong revenue opportunity.

---

## Key Business Opportunities

Based on the analysis, three major opportunities emerge:

### 1. Convert First-Time Buyers to Subscribers
- Offer subscription discounts after first purchase
- Trigger reminders at Day 20–30

### 2. Optimize Product Pages for Top SKUs
Focus on **Apple Cider Vinegar**:
- Add bundles
- Add testimonials
- Add subscription prompts

### 3. Retention Campaigns for One-Time Buyers
- Email/SMS reminders at:
  - Day 15
  - Day 30
- Offer personalized product recommendations

---
## Proposed Experiment: Second-Purchase Incentive

**Problem:**  
Nearly **48% of customers churn after their first purchase**, making the second order the biggest drop-off point in the customer lifecycle.

**Hypothesis:**  
Since a large portion of users drop off after their first purchase, improving second-order conversion is the biggest revenue opportunity.  
Offering a **free complementary product** on the second purchase could increase repeat rate while introducing customers to new product categories.

**Proposed experiment:**
- Offer a **free complementary product** on the customer’s second purchase.
- Example: Customers who purchase digestive or wellness products may receive a **free Gut Cleanse** on their second order.
- Target customers who have completed their first order but have not repurchased within **45 days**.

**Engagement strategy:**
- Send a **WhatsApp or email reminder** around **Day 45** after the first purchase.
- Message example:
  - “You’re eligible for a free complementary product on your next order. Complete your second purchase to claim it.”

**Objective:**
- Increase repeat purchase rate
- Improve overall LTV
- Encourage cross-category product discovery
- Boost demand for lower-performing SKUs

## Expected Impact & Experiment Hypothesis

If the second-purchase incentive converts even **10% of one-time buyers**, the business could see:

- Higher repeat purchase rates
- Increased subscription adoption
- Improved overall customer lifetime value
- Better product mix across categories

Given:
- 48.2% one-time buyers
- Average order value: ₹757
- Subscribers generate ~20% higher LTV

Even a small lift in second-order conversions could result in a **5–8% increase in overall LTV** across the customer base.
