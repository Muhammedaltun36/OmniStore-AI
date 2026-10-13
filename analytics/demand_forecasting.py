import numpy as np
from sklearn.linear_model import LinearRegression

def predict_future_demand(historical_sales: list, discount_rates: list):
    X = np.array(discount_rates).reshape(-1, 1)
    y = np.array(historical_sales)

    model = LinearRegression()
    model.fit(X, y)

    next_week_discount = np.array([[0.15]])
    predicted_sales = model.predict(next_week_discount)

    return int(round(predicted_sales[0]))

if __name__ == "__main__":
    past_sales = [120, 150, 200, 240, 300]
    past_discounts = [0.05, 0.10, 0.15, 0.20, 0.25]
    
    forecast = predict_future_demand(past_sales, past_discounts)
    print(f"Predicted Demand for Next Week: {forecast} units")
