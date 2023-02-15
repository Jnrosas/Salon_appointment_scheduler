#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e '\n~~~~ Your Salon ~~~~~\n'

MAIN_MENU(){

  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo 'Select the service'
  echo -e '\n1) Corte Masculino\n2) Corte Femenino\n3) Brushing\n4) Tintura\n5) Exit'
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CORTE_MASCULINO ;;
    2) CORTE_FEMENINO ;;
    3) BRUSHING ;;
    4) TINTURA ;;
    5) EXIT ;;
    *) MAIN_MENU "Please enter a valid option" ;;
  esac
}

CORTE_MASCULINO(){
  echo -e '\n==== Corte masculino ====\n'

  # get customer info
  echo -e '\nCual es su Numero de Telefono?\n'
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e '\nCual es su Nombre?\n'
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  echo -e '\nCual es el horario preferido?\n'
  read SERVICE_TIME

  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # insert row in appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Final message
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

CORTE_FEMENINO(){
  echo -e "\n==== Corte femenino ====\n"

  # get customer info
  echo -e '\nCual es su Numero de Telefono?\n'
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e '\nCual es su Nombre?\n'
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  
  echo -e '\nCual es el horario preferido?\n'
  read SERVICE_TIME

  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # insert row in appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Final message
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

BRUSHING(){
  echo -e "\n==== Brushing ====\n"

  # get customer info
  echo -e '\nCual es su Numero de Telefono?\n'
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e '\nCual es su Nombre?\n'
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  
  echo -e '\nCual es el horario preferido?\n'
  read SERVICE_TIME

  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # insert row in appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Final message
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

TINTURA(){
  echo -e "\n==== Tintura ====\n"

  # get customer info
  echo -e '\nCual es su Numero de Telefono?\n'
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e '\nCual es su Nombre?\n'
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  
  echo -e '\nCual es el horario preferido?\n'
  read SERVICE_TIME

  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # insert row in appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Final message
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

EXIT(){
  echo -e '\nThank you for visiting the Salon\n'
}

MAIN_MENU
