以下のようなエラーが出る場合の対処

    RuntimeError: IllegalOperation: System[System:/:cell]: SIZE variable is not associated (System[System:/:cell])

* 原因１：SBML中に初期値が未確定の値がある。  
    * 対応：EM中では「Unknown」になっているので、手計算あるいは適当な初期値を与えた後の１ステップ走らせて初期値を得る。

### Header

```
# created by eml2em program
# from file: BIOMD0000000003.eml, date: Sun Dec 15 15:39:00 2013
#
# BIOMD0000000003 - Goldbeter1991 - Min Mit Oscil
# 
# Goldbeter A. 
# A minimal cascade model for the mitotic oscillator involving cyclin and cdc2 kinase. 
# Proc. Natl. Acad. Sci. U.S.A. 1991 Oct; 88(20): 9107-9111 
# Faculté des Sciences, Université Libre de Bruxelles, Belgium.


##### Steppers #####

Stepper FixedODE1Stepper( DE ) {}
Stepper DiscreteTimeStepper( DT ) {}

##### Model Entities #####
```
