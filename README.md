# Devops LVL3 project

## Hexlet tests and linter status:
[![Actions Status](https://github.com/fey/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/fey/devops-for-programmers-project-lvl3/actions)

## Требования

* Ansible 2.11+
* Terraform 1.0.4
* make

## Подготовка

```sh
make setup
```

### Создание инфраструктуры

* Зарегистрироваться на [https://app.terraform.io/app](https://app.terraform.io/app)

  Создать там секретные переменные

  * datadog_api_key
  * datadog_app_key
  * do_token

* Залогиниться `terraform login`

* Выполнить `make tf-apply`

### Деплой

* Добавить секрет в файл *./vault-password*
* Выполнить `make deploy`

### Прочее

* Необходимые команды для работы с Vault описаны в *ansible/make-vault.mk*
