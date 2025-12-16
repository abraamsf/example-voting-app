# Simple Monitoring Plan

## 1. What did we monitor?

1.  **Rate:** Seberapa ramai yang akses (Traffic).
2.  **Errors:** Apakah ada yang gagal vote (Error 500).
3.  **Duration:** Seberapa cepat website loading.

## 2. Tools used
* **Prometheus:** To get data numbers from the application
* **Grafana:** To create a visualization that is easy to read
* **Slack Alert:** To sent a notification if the website is down

## 3. Setup Example
I will create endpoint `/metrics` on the python app, and configure prometheus to check it every 15 seconds

**Prometheus configuration example (pseudocode)**
```yaml
scrape_configs:
  - job_name: 'vote-app'
    # get data from the voting application at port 80
    targets: ['vote-service:80']
    scrape_interval: 15s