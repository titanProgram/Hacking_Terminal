class userInfo
{
  // data
  String name;
  String location;
  String bankAccNo;
  String emailTo;
  String emailMsg;
  // amount of money in bank account
  float amount;
  int age;
 
  // constructor
  userInfo( String name, int age, String location, String bankAccNo, float amount, String emailTo, String emailMsg )
  {
    this.name = name;
    this.age = age;
    this.location = location;
    this.bankAccNo = bankAccNo;
    this.amount = amount;
    this.emailTo = emailTo;
    this.emailMsg = emailMsg;
  }
  
  // methods
}