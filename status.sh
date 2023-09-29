#!/bin/bash

jobUrl="https://graph.microsoft.com/v1.0/external/connections/samplesolutiongallery/operations/1.neu-b.0289721D1A905693E2D94B88B679E3EE.DA2CCF73CC05CE7FF6DAAA03B0D34A00"

status=$(m365 request -u $jobUrl --query status)
echo "Job status: $status"

# Loop as long as the job is in progress
while [[ $status == "inprogress" ]]; do
  echo "Waiting for 60 seconds..."
  sleep 60

  status=$(m365 request -u $jobUrl --query status)
  echo "Job status: $status"
done

if [[ $status == "succeeded" ]]; then
  echo "Job succeeded"
elif [[ $status == "failed" ]]; then
  echo "Job failed"
else
  echo "Unknown status"
fi