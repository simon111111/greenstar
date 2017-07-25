#############################################################################
##
#W  greenstar.gd
#Y  Copyright (C) 2017                  James D. Mitchell & Simon Tollman
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

## This file contains the declaration for Green's star relations of
## semigroups.

DeclareCategory("IsGreensStarRelation", IsEquivalenceRelation);
DeclareCategory("IsGreensRStarRelation", IsGreensStarRelation);
DeclareCategory("IsGreensLStarRelation", IsGreensStarRelation);
DeclareCategory("IsGreensJStarRelation", IsGreensStarRelation);
DeclareCategory("IsGreensHStarRelation", IsGreensStarRelation);
DeclareCategory("IsGreensDStarRelation", IsGreensStarRelation);

DeclareAttribute("GreensRStarRelation", IsSemigroup);
DeclareAttribute("GreensLStarRelation", IsSemigroup);
DeclareAttribute("GreensJStarRelation", IsSemigroup);
DeclareAttribute("GreensDStarRelation", IsSemigroup);
DeclareAttribute("GreensHStarRelation", IsSemigroup);

DeclareCategory("IsGreensStarClass", IsEquivalenceClass);
DeclareCategory("IsGreensRStarClass", IsGreensStarClass);
DeclareCategory("IsGreensLStarClass", IsGreensStarClass);
DeclareCategory("IsGreensJStarClass", IsGreensStarClass);
DeclareCategory("IsGreensHStarClass", IsGreensStarClass);
DeclareCategory("IsGreensDStarClass", IsGreensStarClass);

DeclareAttribute("GreensRClasses", IsGreensRStarClass);
DeclareAttribute("GreensLClasses", IsGreensLStarClass);
DeclareAttribute("GreensJClasses", IsGreensJStarClass);
DeclareAttribute("GreensDClasses", IsGreensDStarClass);
DeclareAttribute("GreensHClasses", IsGreensHStarClass);

DeclareAttribute("GreensRStarClasses", IsSemigroup);
DeclareAttribute("GreensLStarClasses", IsSemigroup);
DeclareAttribute("GreensHStarClasses", IsSemigroup);

DeclareOperation("GreensHStarClass", [IsSemigroup, IsObject]);
DeclareOperation("GreensRStarClass", [IsSemigroup, IsObject]);
DeclareOperation("GreensLStarClass", [IsSemigroup, IsObject]);
DeclareOperation("GreensDStarClass", [IsSemigroup, IsObject]);
DeclareOperation("GreensJStarClass", [IsSemigroup, IsObject]);

DeclareRepresentation("IsGreensStarClassByGreensClassesRep", 
                      IsGreensStarClass and IsAttributeStoringRep, []);

DeclareAttribute("GreensRStarClassType", IsSemigroup);
DeclareAttribute("GreensLStarClassType", IsSemigroup);
DeclareAttribute("GreensHStarClassType", IsSemigroup);
DeclareAttribute("GreensDStarClassType", IsSemigroup);
DeclareAttribute("GreensJStarClassType", IsSemigroup);

#DeclareAttribute("RStarClassReps", IsGreensRStarClass);
#DeclareAttribute("LStarClassReps", IsGreensLStarClass);
#DeclareAttribute("HStarClassReps", IsGreensHStarClass);

DeclareAttribute("RStarClassReps", IsSemigroup);
DeclareAttribute("LStarClassReps", IsSemigroup);
DeclareAttribute("HStarClassReps", IsSemigroup);

#DeclareAttribute("NrRStarClasses", IsGreensRStarClass);
#DeclareAttribute("NrLStarClasses", IsGreensLStarClass);
#DeclareAttribute("NrHStarClasses", IsGreensHStarClass);

DeclareAttribute("NrRStarClasses", IsSemigroup);
DeclareAttribute("NrLStarClasses", IsSemigroup);
DeclareAttribute("NrHStarClasses", IsSemigroup);

DeclareAttribute("NrIdempotents", IsGreensRStarClass);
DeclareAttribute("NrIdempotents", IsGreensLStarClass);
DeclareAttribute("NrIdempotents", IsGreensHStarClass);

DeclareAttribute("Idempotents", IsGreensRStarClass);
DeclareAttribute("Idempotents", IsGreensLStarClass);
DeclareAttribute("Idempotents", IsGreensHStarClass);

DeclareAttribute("Size", IsGreensRStarClass);
DeclareAttribute("Size", IsGreensLStarClass);
DeclareAttribute("Size", IsGreensHStarClass);

DeclareAttribute("AsSSortedList", IsGreensRStarClass);
DeclareAttribute("AsSSortedList", IsGreensLStarClass);
DeclareAttribute("AsSSortedList", IsGreensHStarClass);

DeclareProperty("IsAbundantSemigroup", IsSemigroup);
DeclareProperty("IsAdequateSemigroup", IsSemigroup);
DeclareProperty("IsSuperabundantSemigroup", IsSemigroup);

DeclareAttribute("RStarOfHStarClass", IsGreensHStarClass);
DeclareAttribute("LStarOfHStarClass", IsGreensHStarClass);
DeclareAttribute("DStarOfHStarClass", IsGreensHStarClass);

DeclareAttribute("RClassesOfHStarClass", IsGreensHStarClass);
DeclareAttribute("LClassesOfHStarClass", IsGreensHStarClass);
DeclareAttribute("DClassesOfHStarClass", IsGreensHStarClass);




#DeclareAttribute("GreensHStarClasses", IsGreensStarClass);
#DeclareAttribute("GreensRStarClasses", IsGreensDStarClass);
#DeclareAttribute("GreensLStarClasses", IsGreensDStarClass);

#DeclareAttribute("RStarClass", IsStarClass);
#DeclareAttribute("LStarClass", IsStarClass);
#DeclareAttribute("DStarClass", IsStarClass);
#DeclareAttribute("JStarClass", IsStarClass);

