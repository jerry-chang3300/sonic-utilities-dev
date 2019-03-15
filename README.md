## 一開始先安裝pip 跟 virtualenv
sudo apt install python-pip
pip install --upgrade pip
pip install virtualenv

## 創資料夾放virtualenv的設定 (optional)
mkdir sonic-utilities.build
cd sonic-utilities.build

## 創造叫做venv的virtualenv, 並且不延用現在環境的套件(但還是會幫你裝pip等)
virtualenv --no-site-packages venv

## 啟動virtualenv, 要結束的話用deactivate
cd venv
source ./bin/activate
cd ../../

## 執行 python2 -m py.test –v 跑unit test, 中間看到缺甚麼套件就用pip 去裝
## 如果顯示找不到適合的版本, 可能是sonic自己的套件

pip install py
pip install pytest
pip install click
pip install ipaddr
pip install tabulate
pip install natsort
### 顯示要pyangbind.lib.yangtypes, 但 pip 只有 pyangbind, 所以改裝 pyangbind
pip install pyangbind

## 需要 openconfig_acl 和 portconfig, 這兩個套件在sonic-config-engine
## 可能需要使用 sudo 以解決權限問題, 另外需要再透過 easy_install 來安裝
cd sonic-config-engine/
python setup.py build
sudo python setup.py install
cd dist
easy_install sonic_config_engine-1.0-py2.7.egg

## 需要 swsssdk, 可以在sonic-py-swsssdk下安裝
cd ../sonic-py-swsssdk/
python setup.py build
python setup.py install

## 執行 unit test
cd ../sonic-utilities/
python2 -m py.test –v
