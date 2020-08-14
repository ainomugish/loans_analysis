# loans_analysis
world bank loans analysis using kaggle CSV

SQL for database
-------------------------------------------
run database.sql on PostgresSQL(this is what I used)

Input to notebook
-------------------------------------------
sample params.yaml for passing parameters to papermill as input to notebook.
Please populate params with your own details.

cronjob for running Notebook
-------------------------------------------
nano /etc/crontab
0 8 28 * * papermill loans_assessment.ipynb ~/log/nb_output_$(date ‘+%Y_%m_%d’).ipynb -f params.yaml




