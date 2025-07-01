import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('data/telco_churn_cleaned.csv')

print(df.head())
print(df.info())

# def churn_rate_by_category(df, category):
#     return df['Churn'].groupby(df[category]).value_counts(normalize=True).unstack() * 100

# PaymentMethod_churn = churn_rate_by_category(df, 'PaymentMethod')
# InternetService_churn = churn_rate_by_category(df, 'InternetService')
# TechSupport_churn = print(churn_rate_by_category(df, 'TechSupport'))

# #Visualization

# # Churn Rate by Internet Service
# InternetService_churn.plot(kind='bar', stacked=True)
# plt.title('Churn Rate by Contract Type')
# plt.xlabel('Contract Type')
# plt.ylabel('Churn Rate (%)')
# plt.xticks(rotation=45)
# plt.legend(title='Churn', loc='upper right')
# plt.tight_layout()
# plt.show()


# # Churn Rate by Payment Method
# PaymentMethod_churn.plot(kind='bar', stacked=True)
# plt.title('Churn Rate by Payment Method')
# plt.xlabel('Payment Method')
# plt.ylabel('Churn Rate (%)')
# plt.xticks(rotation=45)
# plt.legend(title='Churn', loc='upper right')
# plt.tight_layout()
# plt.show()