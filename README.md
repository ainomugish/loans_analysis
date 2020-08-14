# loans_analysis
world bank loans analysis using kaggle CSV

cronjob for running Notebook
0 8 20 * * papermill loans_assessment.ipynb log/nb_output_$(date ‘+%Y_%m_%d’).ipynb -f params.yaml
