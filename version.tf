terraform {
  required_version = "<= 0.14.0"
  required_providers {

    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "<= 1.20.1"
    }
  }
}
