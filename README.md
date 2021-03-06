# loans_analysis
World Bank loans analysis using kaggle CSV

SQL for database
-------------------------------------------
Run database.pgsql on PostgresSQL(this is what I used).

Input to notebook
-------------------------------------------
Sample params.yaml for passing parameters to papermill as input to notebook.\
Please populate params with your own details, defined here:

filename : absolute path to location of input csv data file\
loan_profile : absolute path to location where field statistics file will be saved.\
port: mail server port\
smtp_server : mail server hostname\
login : mail username\
password : mail password\
subject : "ETL Pipeline Results"\
sender_email : sending email\
receiver_email : receiving email\
dw_string : database connection string\
preserved_file : absolute path for location to save analysed input file for future reference\

NOTE: all paths are required to be absolute paths, eg. /home/username/projects/until/location/of/file

cronjob for running Notebook
-------------------------------------------
nano /etc/crontab\
0 8 28 * * papermill loans_assessment.ipynb ~/log/nb_output_$(date ‘+%Y_%m_%d’).ipynb -f params.yaml

Using those two commands sets up a cronjob that will run on every 28th of the month and supply a YAML file with parameters the notebook requires to run and anlyse the data. Papermill is used for running the notebook automatically.\

Output is a notebook with the results of running the cells in the notebook.

If you chose to run the notbook without scheduling it then run this command:
papermill loans_assessment.ipynb ~/log/nb_output_$(date ‘+%Y_%m_%d’).ipynb -f params.yaml


Visualization
-------------------------------------------
I used metabase(https://www.metabase.com/) for frontend.\

sample at http://104.248.186.13:3000/public/dashboard/5d06d805-f5b3-4151-ba2c-9c002da70c60
