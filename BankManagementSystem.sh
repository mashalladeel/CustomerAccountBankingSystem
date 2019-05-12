echo""
txt="ITC 350-Open Source Software Project"
printf "%*s\n" 50 "$txt"
echo ""
echo =====================================================================================================
txt2="Customer Account Banking System"
printf "%*s\n" 50 "$txt2"
echo ======================================================================================================
echo ""

 echo -e "\e[31m1) Create a new customer account" 
 echo -e "\e[32m2) Update Customer account"
 echo -e "\e[33m3) View and Manage transaction"
 echo -e "\e[34m4) Check Customer's account Details"
 echo -e "\e[0m5) Delete Customer's Account"
 echo -e "\e[36m6) Exit"
 echo ""
 echo -e "\e[32m Enter the option:"

create_user () {
echo -e "\e[31mEnter a name"
  read customer_name
while ! [[ $customer_name =~ ^-?[[:alpha:]]+$ || $customer_name =~ " " ]]; 
do
echo "Please enter a valid name"
  read customer_name
done

echo "Enter the date of birth: (dd/mm/yyy)"
read customer_dbirth
while ! [[ $customer_dbirth = [0-3][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9] ]];
do
echo "Please enter a valid date of birth: "
read customer_dbirth
done

echo "Enter the National ID Number:"
read customer_id
while ! [[ $customer_id =~ ^-?[[:digit:]]+$ || $customer_id =~ " "  ]];
 do
echo "Please enter a valid National ID Number "
  read customer_id
done

echo "Enter Email address"
read customer_emial
while ! [[ "$customer_emial" =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4} ]]
do
echo "Enter a valid Email Address"
read customer_emial
done


echo "Enter the the City Name:"
read Customer_city
while ! [[ $Customer_city =~ ^-?[[:alpha:]]+$ || $Customer_city =~ " " ]]; 
do
echo "Enter a valid City Name:"
read Customer_city
done

echo "Enter a Country Name:"
read Customer_country
while ! [[ $Customer_country =~ ^-?[[:alpha:]]+$ || $Customer_country =~ " " ]]; 
do
echo "Please Enter a valid Country Name"
read Customer_country
done

echo "Enter Phone Number:"
read Customer_phone
digit="^[0-9]{5}$"
while ! [[ $Customer_phone =~ $digit ]];
do
echo "Please Enter a valid Phone Number (5 Digit Number)"
read Customer_phone
done

echo "Enter Account Type (saving/current):"
read Customer_atype
while ! [[ $Customer_atype == "current" || $Customer_atype == "saving" ]];
do
echo "Please choose a valid type (saving/current):"
read Customer_atype
done

echo "Enter the Deposit amount:"
read Customer_deposit
while ! [[ $Customer_deposit =~ ^-?[[:digit:]]+$ ]]; 
do
echo "Please enter a valid customer first deposit amount: "
read $Customer_deposit
done

Customer_ID=$(($RANDOM % 200))
echo "Your ID is: $Customer_ID"

echo "$customer_name", "$customer_dbirth", "$customer_id", "$customer_emial", "$Customer_city", "$Customer_country", "$Customer_phone", "$Customer_atype", "$Customer_deposit", "$Customer_ID" >> CustomerDatabaseFinal.csv
}

Edit_account (){
	echo -e "\e[32mEnter ID to search to update "
	read Customer_ID
	while [[ -z $(awk -v awkID=$Customer_ID '{ if ($10 == awkID) print $10 }' FS="," CustomerDatabaseFinal.csv) ]]; do
	echo "ID not found, Enter Again"
	read Customer_ID
	done
	echo " Please Choose from Options below to update:"
	echo "1) Customer National number"
	echo "2) Customer Email"
	echo "3) Customer City name"
	echo "4) Customer Country name"
	echo "5) Customer Phone number"
	echo "6) Customer Account type"
	echo "7) Balance Amount"
	read Customer_choice

case $Customer_choice in
1)
	echo "Enter new national number"
	read Customer_nnational
	while [[ $Customer_nnational =~ [[:alpha:]] || -z $Customer_nnational ]]; do
	echo "PLease Enter a valid National ID"
	read Customer_nnational
	done
	awk -v awkID=$Customer_ID -v awkData=$Customer_nnational '{ if ($10 == awkID) $3=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "User National ID Updated"
	;;

2)
	echo "Enter new email address"
	read Customer_Nemail
	 while [[ ${Customer_Nemail} != *"@"* || -z $Customer_Nemail ]]; do
	echo "Please Enter a valid Password "
	read Customer_Nemail
	done
	awk -v awkID=$Customer_ID -v awkData=$Customer_Nemail '{ if ($10 == awkID) $4=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "User Email  Updated"
	;;

3)
	echo "Enter your updated city name: "
	read Customer_ncity
	while [[ $Customer_ncity =~ [[:digit:]] || -z $Customer_ncity ]]; do
	echo "Please Enter a valid City Name "
	read Customer_ncity
	done
	awk -v awkID=$Customer_ID -v awkData=$Customer_ncity '{ if ($10 == awkID) $5=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "User City Updated"
	;;

4)
	echo "Enter your Country Name "
	read Customer_ncountry
	while [[ $Customer_ncountry =~ [[:digit:]] || -z $Customer_ncountry ]]; do
	echo "Enter valid Counrtry Name"
	read Customer_ncountry
	done
	awk -v awkID=$Customer_ID -v awkData=Customer_ncountry '{ if ($10 == awkID) $6=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "User Country Updated"
	;;

5)
	echo "Enter your new phone number"
	read Customer_nphone
	while [[ $Customer_nphone =~ [[:alpha:]] || -z $Customer_nphone ]]; do
	echo "Please Enter a valid phone number "
	read Customer_nphone
	done
	awk -v awkID=$Customer_ID -v awkData=$Customer_nphone'{ if ($10 == awkID) $7=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "User Phone Number Updated"
	;;


6)
	echo "Select new account type (saving/current: "
	read Customer_natype
	while ! [[ $Customer_natype == "current" || $Customer_natype == "saving" ]];
	do
	echo "Please choose a valid type (saving/current):"
	read Customer_natype
	done
	awk -v awkID=$Customer_ID -v awkData=$Customer_natype '{ if ($10 == awkID) $8=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	;;


7)
	echo "Enter your new deposit amount: "
	read Customer_ndeposit
	while ! [[ $Customer_ndeposit =~ ^-?[[:digit:]]+$ ]]; 
	do
	echo "Please enter a valid customer first deposit amount: "
	read $Customer_ndeposit
	done
	awk -v awkID=$Customer_ID -v awkData=$Customer_ndeposit '{ if ($10 == awkID) $9=awkData; print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "account updated Successfully!"
	esac
}


User_Transaction (){
	echo -e "\e[34mEnter ID to search: "
	read Customer_ID
	while [[ -z $(awk -v awkID=$Customer_ID '{ if ($10 == awkID) print $10 }' FS="," CustomerDatabaseFinal.csv) ]]; do
	echo "ID not found, try again"
	read Customer_ID
	done
	echo "1) Deposit
	2) Withdraw
	3) Show Balance"

read customer_choice
case $customer_choice in
1)
	echo "Please enter the amount you want to deposit:"
	read Customer_deposit
	balance=`awk -F, '$10 == '$Customer_ID' {print $9}' CustomerDatabaseFinal.csv`  # input = newBal
	balanceupdated=`expr $Customer_deposit + $balance`

	awk -v id=$Customer_ID -v input=$balanceupdated 'BEGIN{FS=","; OFS=","} { if ($10 ~ id) $9=input; print}' CustomerDatabaseFinal.csv > temp.tmp && mv temp.tmp CustomerDatabaseFinal.csv
	echo "Success! The amount is Successfully added to your account!"
	echo "Your current balance is:"
	awk -v id=$Customer_ID 'BEGIN{FS=","; OFS="|"; NR==1} { if ($10 == id) { print $9 } }' CustomerDatabaseFinal.csv
;;

2)
	echo "Please enter the amount you want to Withdraw:"
	read Customer_withdraw
	balance=`awk -F, '$10 == '$Customer_ID' {print $9}' CustomerDatabaseFinal.csv`  # input = newBal
	balanceupdated=`expr  $balance - $Customer_withdraw`

	awk -v id=$Customer_ID -v input=$balanceupdated 'BEGIN{FS=","; OFS=","} { if ($10 ~ id) $9=input; print}' CustomerDatabaseFinal.csv > temp.tmp && mv temp.tmp CustomerDatabaseFinal.csv
	echo "Success! The amount is Successfully added to your account!"
	echo "Your current balance is:"
	awk -v id=$Customer_ID 'BEGIN{FS=","; OFS="|"; NR==1} { if ($10 == id) { print $9 } }' CustomerDatabaseFinal.csv
;;

3)	
	echo ""
	echo "The customer's current balance is:"
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print $9 }' FS="," CustomerDatabaseFinal.csv
esac
}

Delete_User (){
	echo -e "\e[0mEnter ID to search "
	read Customer_ID
	while [[ -z $(awk -v awkID=$Customer_ID '{ if ($10 == awkID) print $10 }' FS="," CustomerDatabaseFinal.csv) ]]; do
	echo "ID not found, Enter Again"
	read Customer_ID
	done
	awk -v awkID=$Customer_ID '{ if ($10 != awkID) print $0 > "CustomerDatabaseFinal.csv" }' OFS="," FS="," CustomerDatabaseFinal.csv
	echo "User Deleted Successfully!"
}

View_User (){
	echo -e "\e[33mEnter ID to search "
	read Customer_ID
	while [[ -z $(awk -v awkID=$Customer_ID '{ if ($10 == awkID) print $10 }' FS="," CustomerDatabaseFinal.csv) ]]; do
	echo "ID not found Enter Again"
	read Customer_ID
	done
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "Name: " $1}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "National Number: " $2}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "Email: " $3}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "City name: " $4}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "Country name: " $5}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "Phone number: " $6}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "Account type: " $7}' FS="," CustomerDatabaseFinal.csv
	awk -v awkID=$Customer_ID '{ if ($10 == awkID) print "Balance: " $9}' FS="," CustomerDatabaseFinal.csv
}

read user_command
case $user_command in 
1) create_user
;;
2) Edit_account
;;
3) View_User
;;
4) User_Transaction
;;
5) Delete_User
;;
6) echo "Goodbye!"
esac
