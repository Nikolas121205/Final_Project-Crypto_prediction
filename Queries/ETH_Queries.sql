USE ETHERUM;

ALTER TABLE ETH_historical
CHANGE COLUMN `6. market cap(USD)` `market_Cap(USD)` DOUBLE;

ALTER TABLE ETH_historical
CHANGE COLUMN `volume` volume FLOAT;

ALTER TABLE ETH_historical
CHANGE COLUMN `Difference between opening and closing` difference_between_opening_and_closing DOUBLE;

-- 1 What is the Average Volume/the total number of units of the cryptocurrency traded per month?

SELECT YEAR(Date) AS year, MONTH(Date) AS month,
       AVG(volume) AS average_volume
FROM ETH_historical
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY year, month;


-- 2 What is the change in price between opening and closing prices for each day?

SELECT Date, 
       ((`Closing Price (USD)` - `Opening Price (USD)`) / `Opening Price (USD)`) * 100 AS price_change_percentage
FROM ETH_historical
ORDER BY Date;

-- 3. How does the market Cap affect the Highest Price

SELECT YEAR(Date) AS year, MONTH(Date) AS month,
       MAX(`Highest Price (USD)`) AS max_highest_price,
       AVG(`6. Market Cap (USD)`) AS avg_market_cap
FROM ETH_historical
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY year, month;

-- 4. How did the Difference between opening price and closing price change over the years?
SELECT YEAR(Date) AS year,
       AVG(Difference_between_opening_and_closing) AS avg_price_difference
FROM ETH_historical
GROUP BY YEAR(Date)
ORDER BY year;

-- 5 What is the total volume per year?

Select year(DATE) as year,
Sum(Volume) as total_volume
from ETH_historical
group by year(date)
order by total_volume desc;
