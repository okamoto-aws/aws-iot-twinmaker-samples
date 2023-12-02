#!/bin/sh 

# アプリケーションディレクトリに移動
cd ./aws-iot-twinmaker-samples/src/workspaces/cookiefactoryv3/assistant/

# アプリケーションをフォアグラウンドで実行
chainlit run app/bedrock.py &

cd ../dashboard

npm run dev