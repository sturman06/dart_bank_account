part of BankAccount;

class Person {
  // Person properties:
  String _name, address, _email, _gender;
  DateTime _date_birth;
  
  String get name => _name;
  set name(value) {
   if (value != null && !value.isEmpty) _name = value;
  }
  
  String get email => _email;
  set email(value) {
   if (value != null && !value.isEmpty) _email = value;
  }
  
  String get gender => _gender;
  set gender(value) {
   if (value == 'M' || value == 'F') _gender = value;
  }
  
  DateTime get birth_date =>  _date_birth;
  set birth_date(value) {
   DateTime now = new DateTime.now();
   if (value.isBefore(now)) _date_birth = value;
  }
  
  // constructor:
  // Person(this.name, this.address, this.email, this.gender, this.date_birth);
  // doesn't work: unresolved reference to instance field 'name'  ?!
  // reason: In a constructor initializer list (or in an initializing formal), the object isn't available yet,
  // and you can't call instance methods
  Person(name, this.address, email, gender, date_birth) {
   this.name = name;
   this.email = email;
   this.gender = gender;
   this.birth_date = date_birth;
   
}
// methods:
String toString() => 'Person: $name, $gender';
Map<String, Object>toJson() {
     var per = new Map<String, Object>();
     per["name"] = name;
     per["address"] = address;
     per["email"] = email;
     per["gender"] = gender;
     per["birthdate"] = birth_date.toString();
     return per;
   }
}
/* to check:
 *
 * 1) when the web page is loaded the cursor remains in the address bar, a
 * new refresh is necessary to focus on name;
 * window.onLoad does not fix this
 * 2) when Blur and then Change event goes off, the same message appears twice
 *
*/