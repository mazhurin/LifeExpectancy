# LifeExpectancy
Life Expectancy Calculator

## Description
Life expectancy is a statistical measure of how long an organism may live, based on the year of their birth, their current age and other demographic factors including sex.
This Life expectancy calculator is base on the data published by World Health Organization

## Dataset
You can find the dataset [here](http://apps.who.int/gho/data/node.main.688?lang=en)

## Online Calculator
You can test the calculator online [here](https://greymemory.shinyapps.io/LifeExpectancy/)

## Under the hood
The calcularor is building a linear model using year as a predictor and life expectancy as an outcome.
The data for the model is filtered by selected country and sex.
