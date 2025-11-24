# MUSA 5080 Final Project
## Iron Chef Meets Shark Tank Meets Kaggle 

**Presentation Date:** Monday, December 8, 2025  
**Team Size:** 3-4 students per team  
**Format:** In-class presentation with live Q&A (judges will grill you!)

---

## Overview

Welcome to the ultimate data science showdown! Your team will compete to build the most compelling predictive model that serves a real public policy need. Like Iron Chef, you'll work with a "secret ingredient" (your chosen dataset). Like Shark Tank, you'll pitch your model's value to city decision-makers. And like Kaggle, you'll be evaluated on both technical rigor and real-world applicability.

**The Challenge:** Build a predictive model that city officials would actually want to use, using only the techniques we've covered this semester.

**The Stakes:** Your presentation will be evaluated by a panel of judges (your professor + a surprise guest) who will grill you on your methods, assumptions, and recommendations. You need to demonstrate not just technical competence, but deep understanding of what you've built and why it matters.

---

## The Secret Ingredient: Dataset Options

For each dataset option:

- **Your Task:** Through exploratory data analysis, identify what predictive question would be most useful for policy and determine what outcome variable makes sense to predict

**Consider:**

- What policy context does this address?
- Who are the stakeholders?
- What would you predict (counts? yes/no? risk levels?)?
- What other data would enrich this analysis?
- What method is appropriate for your chosen outcome?
- What could go wrong? Who could be harmed?
Like Iron Chef's mystery ingredient, you must choose ONE of the following as your **primary dataset**. However, you should (and are strongly encouraged to) incorporate additional data sources to enrich your analysis.

### Option 1: Eviction Data
- **Primary Source:** [Eviction Lab Philadelphia Tracking](https://evictionlab.org/eviction-tracking/philadelphia-pa/)
- **Description:** Eviction filing data for Philadelphia

---

### Option 2: Property Tax Delinquency
- **Primary Source:** [Real Estate Tax Balances](https://opendataphilly.org/datasets/real-estate-tax-balances/)
- **Description:** Outstanding real estate tax balances for Philadelphia properties

---

### Option 3: Transit Ridership
- **Primary Source:** [SEPTA Ridership Statistics](https://opendataphilly.org/datasets/septa-ridership-statistics/)
- **Description:** Ridership data by route, line, station, time period, and mode

---

### Option 4: Building Inspections
- **Primary Source:** [L&I Building Certifications](https://opendataphilly.org/datasets/licenses-and-inspections-building-certifications/)
- **Description:** Required periodic inspections for certain buildings - certification status (pass/fail/deficient)

---

## Technical Requirements

### Your Model Must:

1. **Start with Exploratory Data Analysis**

   - **Before** deciding what to predict, explore your data thoroughly
   - Understand distributions, patterns, data quality issues
   - Let the EDA guide your problem framing and use case selection
   - Document your EDA process - this is where you justify your decisions

2. **Incorporate Multiple Data Sources**

   - Your primary dataset alone is NOT enough for a strong model
   - You should integrate Census/ACS data, property characteristics, spatial features, and other relevant OpenDataPhilly datasets
   - Document where each data source comes from and why you chose it
   - Be transparent about how you joined/merged datasets

3. **Be Predictive**

   - Must forecast or predict an outcome 
   - Must demonstrate clear out-of-sample prediction accuracy
   - Must use appropriate train/test splits or cross-validation

4. **Use Course Techniques ONLY**

   Your toolbox includes (and is limited to):

   - **Regression methods:** 
   
     - Linear regression (OLS)
     - Logistic regression
     - Count models (Poisson/negative binomial) 
     - Space Time Models
     
   - **Feature engineering:**
   
     - Categorical variables and interactions
     - Polynomial terms
     - Spatial features (buffers, kNN, distance to amenities)
     - Neighborhood fixed effects
     - Local Hotspots & Cold Spots (+ Distance to them)
     - k-means
     
   - **Model evaluation:**
   
     - Train/test splits
     - Cross-validation (k-fold, LOOCV, spatial CV)
     - Appropriate accuracy metrics (MAE, RMSE, confusion matrices, etc.)
     - Spatial autocorrelation diagnostics (Moran's I)


5. **Demonstrate Appropriate Application**

   - Choose the RIGHT technique for your problem (don't use logistic regression for continuous outcomes!)
   - Choose a spatial analytical unit (buildling, tract, grid, hexagon, etc.)
   - Show you understand WHY each method is appropriate
   - Consider and discuss model limitations

6. **Document Transparently**

   - Show ALL data cleaning steps (don't hide messy decisions!)
   - Explain why you made each choice (variable selection, transformations, etc.)
   - Acknowledge what you tried that didn't work
   - Be honest about limitations and uncertainties - you are given an unreasonably short amount of time for this. Limitations are expected, we just want you to be transparent. Be decisive & don't try to do too much!

7. **Serve a Clear Purpose**

   - Must address a real policy question or decision
   - Must be useful to city officials, planners, or community stakeholders
   - Must consider equity implications and potential for bias (but if this is just generic verbatim what AI says, the sharks will not be happy)
   - Must include actionable recommendations

---

## The Shark Tank Pitch: What to "Sell"

Your presentation should answer:

### The Problem

- What policy problem are you solving?
- Who is affected and why does it matter?
- What decision would your model inform?

### The Solution

- What are you predicting and why?
- How does prediction help solve the problem?
- What makes your approach better than current practice?

### The Evidence

- How accurate is your model?
- How did you validate it?
- What are its limitations?
- Could it introduce or perpetuate bias?

### The Implementation

- How would the city actually use this?
- What data would they need to collect?
- What are the costs/benefits?
- What safeguards are needed?

---

## Deliverables

### 1. In-Class Presentation (December 8th)

- **Duration:** 7 minutes max to present + 3 minutes for Q&A from the sharks
- **Format:** Slide deck with visualizations 
- **Content:**

  - Problem statement and policy context (What are you predicting and why?)
  - Data sources and integration approach
  - Methods overview (What technique did you use and why is it appropriate?)
  - Results and model performance (How accurate? How did you validate?)
  - Limitations and bias considerations (What could go wrong? Who could be harmed?)
  - Recommendations for implementation (How would the city actually use this?)
  
- **Audience:** Assume your judges are smart city officials who understand policy but may need technical concepts explained clearly

### 2. Quarto Document + GitHub Repository

- **Due:** Posted to GitHub BEFORE class begins on Monday, December 8th
- **Submit:** GitHub repository link via Canvas
- **Content:**
  - Executive summary (1-2 paragraphs for non-technical readers)
  - Full reproducible analysis starting with EDA
  - ALL code, outputs, and visualizations
  - Transparent documentation of all data cleaning and decision-making
  - Discussion of methods and why they're appropriate
  - Model validation and performance assessment
  - Limitations and ethical considerations
  - Data sources and integration methods clearly documented
  
- **Style:** Professional portfolio piece (remember, potential employers will see this!)
- **Repository must include:**

  - Well-organized file structure
  - Clean, commented code
  - README explaining project
  - All data sources documented (or links to where they can be downloaded)

**THIS IS YOUR LAST ASSIGNMENT OF THE SEMESTER! 🎉**

---

## Evaluation Criteria

Your project will be evaluated on:

### Technical Rigor 

- Appropriate method selection for the problem
- Correct implementation of techniques
- Thorough model validation and testing
- Clear demonstration of technical understanding during Q&A

### Policy Relevance (

- Addresses a meaningful policy question
- Provides actionable insights
- Considers implementation feasibility
- Connects predictions to decisions

### Critical Analysis 

- Acknowledges limitations honestly
- Considers potential for bias and harm
- Discusses ethical implications
- Proposes appropriate safeguards

### Communication 

- Clear, compelling presentation
- Effective visualizations
- Professional documentation
- Ability to explain technical concepts to non-technical audience

---

## The Grilling: What to Expect

During your presentation, judges will ask probing questions such as:

**Technical Understanding:**

- "Why did you choose [method X] instead of [method Y]?"
- "What happens if [assumption Z] is violated?"
- "How do you know your model isn't just overfitting?"

**Policy Implications:**

- "What happens to communities your model predicts poorly for?"
- "How would you explain this to city council?"
- "What could go wrong if the city implements this?"

**Ethical Considerations:**

- "Could this system perpetuate existing inequities?"
- "Who would be harmed if your model is wrong?"
- "What safeguards would you build in?"

**Be prepared to defend every decision you made.**

---

## Time Management & Team Workflow

### CRITICAL: You Have Limited Time!

**Due date: In-class presentations Monday, December 8th**
**Repo must be posted BEFORE class begins on the 8th**

This is a **tight timeline**, so strategy matters more than ambition:

**✅ DO THIS:** Smaller scope, thorough execution, solid understanding  (beautiful)
**❌ DON'T DO THIS:** Overly ambitious project, surface-level analysis, can't defend your choices

## Recommended Timeline (Adapt to Your Team)

**Week 1 (Immediately):**

- Form teams and select dataset
- **START WITH EDA** - load the data, explore it, understand what you have
- Let the EDA guide your problem framing
- Identify what additional data sources you need

**Week 2: (You'll have all class period on 12/1 to work on this)**

- Define your specific predictive question based on EDA insights
- Gather and integrate additional datasets (Census, spatial features, etc.)
- Build baseline model(s)
- Start documenting your process

**Week 3 (Final Sprint):**

- Refine model, validate thoroughly
- Conduct bias/equity review
- Prepare presentation and slides
- **CRITICAL:** Test your repo, make sure everything renders
- Post repo BEFORE Monday morning!

### Team Roles & Collaboration


**Consider defining roles within your team:**

Everyone contributes to everything, but having point people prevents duplication and ensures nothing gets missed.

### GitHub Repository Requirements

**Make a plan NOW for posting your repo before class on December 8th:**

- Test that your Quarto document renders completely
- Include clear README
- Organized file structure
- All data sources documented
- Clean, commented code

**Don't wait until very late Sunday night to discover your repo won't render!**


