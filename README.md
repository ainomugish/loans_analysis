# loans_analysis
world bank loans analysis using kaggle CSV

SQL for database
-------------------------------------------
run database.sql on PostgresSQL(this is what I used).

Input to notebook
-------------------------------------------
sample params.yaml for passing parameters to papermill as input to notebook.
Please populate params with your own details.

cronjob for running Notebook
-------------------------------------------
nano /etc/crontab.
0 8 28 * * papermill loans_assessment.ipynb ~/log/nb_output_$(date ‘+%Y_%m_%d’).ipynb -f params.yaml.

Visualization
-------------------------------------------
I used metabase(https://www.metabase.com/) for frontend.

sample at http://104.248.186.13:3000/public/dashboard/5d06d805-f5b3-4151-ba2c-9c002da70c60
