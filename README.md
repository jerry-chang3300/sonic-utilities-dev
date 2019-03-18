# 簡介
這個 project 是用來開發 sonic-utilities (CLI), 同時也包含了 sonic-config-engine (sonic-cfggen) 和 sonic-py-swsssdk (swsssdk) 的部分  


# 安裝流程
## 安裝 pip 跟 virtualenv
```
sudo apt install python-pip  
pip install --upgrade pip  
pip install virtualenv  
```

## clone repository
```
git clone https://github.com/jerry-chang3300/sonic-utilities-dev.git
```

## 複製 sonic-utilities / sonic-config-engine / sonic-py-swsssdk
```
git clone https://github.com/Azure/sonic-utilities.git
git clone https://github.com/Azure/sonic-buildimage.git  
cp -r sonic-buildimage/src/sonic-config-engine/ ./
git clone https://github.com/Azure/sonic-py-swsssdk.git
```

## 創造 virtualenv
創造叫做 venv 的 virtualenv, 並且不延用現在環境的套件(但還是會幫你裝pip等)  
```
virtualenv --no-site-packages venv  
```

## 啟動 virtualenv
要結束的話用deactivate  
```
cd venv  
source ./bin/activate  
cd ../  
```

## 安裝 python 套件
顯示要pyangbind.lib.yangtypes, 但 pip 只有 pyangbind, 所以改裝 pyangbind
```
~pip install py pytest click ipaddr natsort tabulate pyangbind~
pip install -r requirements.txt
```

## 安裝 sonic-config-engine
需要 openconfig_acl 和 portconfig, 這兩個套件在sonic-config-engine  
可能需要使用 sudo 以解決權限問題, 另外需要再透過 easy_install 來安裝(TODO?)  
```
cd sonic-config-engine/  
python setup.py build  
sudo python setup.py install  
cd dist  
easy_install sonic_config_engine-1.0-py2.7.egg  
```

## 安裝 sonic-py-swsssdk
```
cd ../../sonic-py-swsssdk/  
python setup.py build  
python setup.py install  
```

## 執行 unit test
```
cd ../sonic-utilities/  
python2 -m py.test –v  
```
(現在的 source code 好像有點問題, 可能要暫時改成)
```
cd ../sonic-utilities/sonic-utilities-tests
python acl_loader_test.py
python port2alias_test.py
```

