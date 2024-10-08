# terr3
ссылка на последний commit 
```
https://github.com/StepanovSA/terr3/commit/c41be0db7cd16b76d7aed528b8dc23bed435d528
```
# Задание 1

1) Изучите проект.
2) Заполните файл personal.auto.tfvars.
3) Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.
Примечание. Если у вас не активирован preview-доступ к функционалу «Группы безопасности» в Yandex Cloud, запросите доступ у поддержки облачного провайдера. Обычно его выдают в течение 24-х часов.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.

# Ответ

![alt text](https://github.com/StepanovSA/terr3/blob/main/1%20ex.PNG)

# Задание 2

1) Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
2) Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop.

# Ответ

![alt text](https://github.com/StepanovSA/terr3/blob/main/2%20ex.PNG)

# Задание 3

1) Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .
2) Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

# Ответ

![alt text](https://github.com/StepanovSA/terr3/blob/main/3%20ex.PNG)

![alt text](https://github.com/StepanovSA/terr3/blob/main/3%20ex%202.PNG)

# Задание 4

1) В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. Готовый код возьмите из демонстрации к лекции demonstration2. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
2) Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
3) Добавьте в инвентарь переменную fqdn.
Пример fqdn: web1.ru-central1.internal(в случае указания переменной hostname(не путать с переменной name)); fhm8k1oojmm5lie8i22a.auto.internal(в случае отсутвия перменной hostname - автоматическая генерация имени, зона изменяется на auto). нужную вам переменную найдите в документации провайдера или terraform console. 4. Выполните код. Приложите скриншот получившегося файла.

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.
Удалите все созданные ресурсы.

# Ответ

Вывод с внешними ip
![alt text](https://github.com/StepanovSA/terr3/blob/main/inventory.cfg.PNG)

Вывод с локальными ip
![alt text](https://github.com/StepanovSA/terr3/blob/main/вывод%20с%20локальными%20адресами.PNG)

