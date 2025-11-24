# HW5: Your Turn! 

For Homework 5, you'll work either all byyyy yourself or in teams of 2 to:

## Part 1: Replicate with Different Quarter (alternately, you could do a longer time-span by merging multiple quarters together. I'm not picky about that)

1. **Download data** for Q2, Q3, or Q4 2024 from: https://www.rideindego.com/about/data/

2. **Adapt this code** to work with your quarter:

   - Update date ranges for weather data
   - Check for any data structure changes
   - Create the same 5 models
   - Calculate MAE for each model

3. **Compare results** to Q1 2025:

   - How do MAE values compare? Why might they differ?
   - Are temporal patterns different (e.g., summer vs. winter)?
   - Which features are most important in your quarter?

## Part 2: Error Analysis 

Analyze your model's errors in detail:

1. **Spatial patterns:**

   - Create error maps
   - Identify neighborhoods with high errors
   - Hypothesize why (missing features? different demand patterns?)

2. **Temporal patterns:**

   - When are errors highest?
   - Do certain hours/days have systematic under/over-prediction?
   - Are there seasonal patterns?

3. **Demographic patterns:**

   - Relate errors to census characteristics
   - Are certain communities systematically harder to predict?
   - What are the equity implications?

## Part 3: Feature Engineering & model improvement

Based on your error analysis, add 2-3 NEW features to improve the model:

**Potential features to consider:**

*Temporal features:*

- Holiday indicators (Memorial Day, July 4th, Labor Day)
- School calendar (Penn, Drexel, Temple in session?)
- Special events (concerts, sports games, conventions)
- Day of month (payday effects?)

*Weather features:*

- Feels-like temperature (wind chill/heat index)
- "Perfect biking weather" indicator (60-75°F, no rain)
- Precipitation forecast (not just current)
- Weekend + nice weather interaction

*Spatial features:*

- Distance to Center City
- Distance to nearest university
- Distance to nearest park
- Points of interest nearby (restaurants, offices, bars)
- Station capacity
- Bike lane connectivity

*Trip history features:*

- Rolling 7-day average demand
- Same hour last week
- Station "type" clustering (residential, commercial, tourist)

**Implementation:**

- Add your features to the best model 
- Compare MAE before and after
- Explain *why* you chose these features
- Did they improve predictions? Where?

**Try a poisson model for count data**

- Does this improve model fit?

## Part 4: Critical Reflection 

Write 1-2 paragraphs addressing:

1. **Operational implications:**
   - Is your final MAE "good enough" for Indego to use?
   - When do prediction errors cause problems for rebalancing?
   - Would you recommend deploying this system? Under what conditions?

2. **Equity considerations:**
   - Do prediction errors disproportionately affect certain neighborhoods?
   - Could this system worsen existing disparities in bike access?
   - What safeguards would you recommend?

3. **Model limitations:**
   - What patterns is your model missing?
   - What assumptions might not hold in real deployment?
   - How would you improve this with more time/data?

---

# Submission Requirements

## What to Submit (per team)

1. **qmd file** with all your code (commented!)
2. **HTML output** with results and visualizations
3. **Brief report** summarizing (with supporting data & visualization):

   - Your quarter and why you chose it
   - Model comparison results
   - Error analysis insights
   - New features you added and why
   - Critical reflection on deployment
4. You only need to submitted once as a team (one submit the link to your portfolio on Canvas)

## Tips for Success

1. **Start early** - data download and processing takes time
2. **Work together** - pair programming is your friend
3. **Test incrementally** - don't wait until the end to run code
4. **Document everything** - explain your choices
5. **Be creative** - the best features come from understanding Philly!
6. **Think critically** - technical sophistication isn't enough

---
