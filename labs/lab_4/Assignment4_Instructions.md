# Lab Assignment 4: Spatial Predictive Analysis
## MUSA 5080 - Fall 2025

---

## Assignment Overview

In this lab, you will apply the spatial predictive modeling techniques demonstrated in the class exercise using a different 311 service request type of your choice as the primary explanatory variable. You will build a complete spatial predictive model, document your process, and interpret your results.

### Timeline & Deliverables

**Due Date:** November 17, 2025, 10:00AM

**Deliverable:** One rendered document, posted to your portfolio website.

### Learning Goals

By completing this assignment, you will demonstrate your ability to:

- Adapt example code to analyze a new dataset
- Build spatial features for predictive modeling
- Apply count regression techniques to spatial data
- Implement spatial cross-validation
- Interpret and communicate model results
- Critically evaluate model performance

---

## Step 1: Choose Your 311 Violation Type

### Getting the Data

Visit the Chicago 311 Service Requests dataset:

**https://data.cityofchicago.org/stories/s/311-Dataset-Changes-12-11-2018/d7nq-5g7t**

Browse the available service request types (e.g., Graffiti Removal, Pothole Repair, Street Light Out, Sanitation Code Violations, etc.) and **choose one violation type** that interests you.

### Requirements for Your Choice

- Choose a **different** violation type than the abandoned cars we did in class.
---

## Step 2: Complete the Analysis

Using the class exercise as your template, adapt the code to analyze your chosen 311 violation type.

### What to Include

Work through all major sections of the analysis:

#### Part 1: Data Loading & Exploration
- Load your 311 data and Chicago spatial boundaries
- Create visualizations showing the spatial distribution of your violation type
- Describe patterns you observe

#### Part 2: Fishnet Grid Creation
- Create a 500m x 500m fishnet grid
- Aggregate your violations to grid cells
- Visualize the count distribution

#### Part 3: Spatial Features
- Calculate k-nearest neighbor features
- Perform Local Moran's I analysis
- Identify hot spots and cold spots
- Create distance-to-hotspot measures
- Join any additional contextual data if you are looking for more to do and really get into this (e.g., demographics, land use)

#### Part 4: Count Regression Models
- Fit Poisson regression
- Fit Negative Binomial regression
- Compare model fit (AIC)

#### Part 5: Spatial Cross-Validation (2017)
- Implement Leave-One-Group-Out cross-validation on 2017 data
- Calculate and report error metrics (MAE, RMSE)

#### Part 6: Model Evaluation
- Compare to KDE baseline

#### CHALLENGE TASK: Temporal Validation (2018) *not mandatory, only if you want very strong spatial analytics muscles*
- Download 2018 crimes https://data.cityofchicago.org/Public-Safety/Crimes-2018/3i3m-jwuy/about_data
- Be sure to filter for BURGLARIES (FORCED ENTRY only to match the 2017 data)
- Aggregate 2018 violations to the same fishnet grid
- Use your 2017 model to predict 2018 counts
- Calculate temporal validation metrics
- Compare spatial vs. temporal validation performance

---

## Step 3: Write Your Analysis

### Critical Requirement: Explain Each Step

**For each major section, you must explain in your own words:**

- **What** you are doing in that step
- **Why** this step is important for the analysis
- **What** you found or learned from the results

Do not simply copy text from the example or from your AI friend. 
Think about the purpose of each technique and articulate it in your own words.

---

## Step 4: Format Your Document

### Formatting Requirements

Your knitted HTML document should be **professional and easy to read**:

#### ✓ Clean Code
- Remove unnecessary code, comments, or debugging lines
- Keep only essential code chunks
- Use `code-fold: show` in your YAML header

#### ✓ Clear Structure
- Use headers to organize sections
- Include a table of contents
- Add your name and date

#### ✓ Readable Text
- Ensure all text renders properly (no broken markdown)
- Check that headers appear as headers (not plain text)
- Use proper markdown formatting

#### ✓ Quality Visualizations
- All plots should have titles and labels
- Maps should be readable
- Use consistent color schemes

#### ✓ Professional Presentation
- Proofread for typos
- Remove any "Your answer here" placeholders
- Make sure all code runs without errors
- Make IT NEAT. WE GOTTA LOOK GOOD HERE.

---

## Submission Checklist

Before you submit, verify that your document includes:

### Required Components

- [ ] **Introduction**: Brief description of your chosen 311 violation type and why you selected it
- [ ] **Data Exploration**: Maps and summary statistics of your violation data
- [ ] **Fishnet Grid**: Successfully created and visualized grid with aggregated counts
- [ ] **Spatial Features**: At least 2-3 spatial features calculated (k-NN, distance measures, etc.)
- [ ] **Local Moran's I**: Spatial autocorrelation analysis with interpretation
- [ ] **Count Regression**: Both Poisson and Negative Binomial models with comparison
- [ ] **Spatial Cross-Validation**: LOGO CV implemented on 2017 data with reported metrics
- [ ] **Temporal Validation**: 2018 data aggregated and tested with 2017 model(OPTIONAL.)
- [ ] **Validation Comparison**: Comparison of spatial vs. temporal validation performance
- [ ] **Model Comparison**: Your model vs. KDE baseline for 2018 predictions
- [ ] **Error Analysis**: Maps and discussion of where model performs well/poorly
- [ ] **Written Explanations**: Your own words explaining each step


### Technical Requirements

- [ ] Document knits to HTML without errors
- [ ] Code is clean and well-organized
- [ ] All visualizations display properly
- [ ] Headers and formatting render correctly
- [ ] File is named successfully posted to your website

---


