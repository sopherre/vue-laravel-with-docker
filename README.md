## VueとLaravel環境の構築


### 前提

ホストマシンに
- VSCode
- Docker
- Docker Compose
が用意されている必要があります。

```sh
docker -v
docker compose version
```

### セットアップ

拡張機能に`Dev Containers`を追加してください。

`Ctrl + P` で表示されるウィンドウに `Dev Containers: Reopen in Container` を入力しEnter

（自動的に必要なパッケージがインストールされてます。）


### アプリケーションの起動

```sh
sh scripts/start.sh
```

ホストマシンのブラウザで

`http://localhost:8000` で Viewが表示され
`http://localhost:8000/api/health` で 正常なレスポンス

が返却されていればアプリケーションの起動に成功
