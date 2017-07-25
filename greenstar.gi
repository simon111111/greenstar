###############################################################################
#W  greenstar.gi
#Y  Copyright (C) 2017                  James D. Mitchell & Simon Tollman
##
##  Licensing information can be found in the README file of this package.
##
###############################################################################


InstallMethod(ViewObj, "for a Green's *-relation",
[IsGreensStarRelation],
AbsInt(RankFilter(IsLeftSemigroupCongruence)
- RankFilter(IsGreensStarRelation)) + 1,
function(rel)
  Print(ViewString(rel));
end);


InstallMethod(ViewString, "for a Green's *-relation",
[IsGreensStarRelation],
AbsInt(RankFilter(IsLeftSemigroupCongruence)
- RankFilter(IsGreensStarRelation)) + 1,
function(rel)
  local  str;
  str := "\><";
  Append( str, "\>Green's\< " );
  if IsGreensDStarRelation(rel)  then
    Append( str, "D" );
  elif IsGreensRStarRelation(rel)  then
    Append(str, "R");
  elif IsGreensLStarRelation(rel)  then
    Append(str, "L");
  elif IsGreensHStarRelation(rel)  then
    Append( str, "H" );
  elif IsGreensJStarRelation(rel)  then
    Append( str, "J" );
  fi;
  Append(str, "*-relation of ");
  Append(str, ViewString(Source(rel)));
  Append(str, ">\<" );
  return str;
end);


InstallMethod(ViewObj, "for a Green's *-class",
[IsGreensStarClass],
function(C)
  Print(ViewString(C));
end);


InstallMethod(ViewString, "for a Green's *-class",
[IsGreensStarClass],
function(C)
  local str;
  str := "\><";
  Append( str, "\>Green's\< " );
  if IsGreensDStarClass(C) then
    Append(str, "D");
  elif IsGreensRStarClass(C) then
    Append(str, "R");
  elif IsGreensLStarClass(C) then
    Append(str, "L");
  elif IsGreensHStarClass(C) then
    Append(str, "H");
  elif IsGreensJStarClass(C) then
    Append(str, "J");
  fi;
  Append(str, "*-class: ");
  Append(str, ViewString(Representative(C)));
  Append(str, ">\<");
  return str;
end);


#AsList-------------------------------------------------------------------------


# Q_JDM:
# We needed a function to resolve errors requesting methods Enumerate and 
# ImagesElm. AsList was added in lieu of Enumerate right? We didn't add anything
# for ImagesElms if I recall, though no error is now thrown. Was Enumerator
# calling ImagesElm and now that that's rectified, all is well? Should something
# be added for ImagesElm?


InstallMethod(AsList, "for a Green's R*-class", 
[IsGreensRStarClass],
function(R)
  return Concatenation(List(GreensRClasses(R), AsList)); 
end);


InstallMethod(AsList, "for a Green's L*-class", 
[IsGreensLStarClass],
function(L)
  return Concatenation(List(GreensLClasses(L), AsList)); 
end);


InstallMethod(AsList, "for a Green's H*-class", 
[IsGreensHStarClass],
function(H)
  return Concatenation(List(GreensHClasses(H), AsList)); 
end);


#GreensXStarRelation------------------------------------------------------------


# Q_JDM:
# Save L* and R* (I'd originally thought H* too but that's incorrect
# right?) the other *-relations aren't congruences correct? I've commented out
# the IsSemigroupCongruence line in the outer GreensXStarRelation methods. 
# Should the line be removed or replaced or left as is for now?

# Q_JDM:
# Our filter (correct jargon?) here is IsSemigroup so the method will take any
# semigroup and that's appropriate here right? Is it appropriate for our
# functions that are only valid transformation semigroups? Should
# IsTransformation be used in those cases?


InstallMethod(GreensRStarRelation, "for a semigroup",
[IsSemigroup],
function(S)
  local fam, type, rel;

  fam := GeneralMappingsFamily(ElementsFamily(FamilyObj(S)),
                               ElementsFamily(FamilyObj(S)));

  type := NewType(fam,
                  IsEquivalenceRelation
                  and IsEquivalenceRelationDefaultRep
                  and IsGreensRStarRelation);

  rel := Objectify(type, rec());

  SetSource(rel, S);
  SetRange(rel, S);

  SetIsLeftSemigroupCongruence(rel, true);
  return rel;
end);


InstallMethod(GreensLStarRelation, "for a semigroup",
[IsSemigroup],
function(S)
  local fam, type, rel;

  fam := GeneralMappingsFamily(ElementsFamily(FamilyObj(S)),
                               ElementsFamily(FamilyObj(S)));

  type := NewType(fam,
                  IsEquivalenceRelation
                  and IsEquivalenceRelationDefaultRep
                  and IsGreensLStarRelation);

  rel := Objectify(type, rec());

  SetSource(rel, S);
  SetRange(rel, S);

  SetIsRightSemigroupCongruence(rel, true);
  return rel;
end);


InstallMethod(GreensHStarRelation, "for a semigroup",
[IsSemigroup],
function(S)
  local fam, type, rel;

  fam := GeneralMappingsFamily(ElementsFamily(FamilyObj(S)),
                               ElementsFamily(FamilyObj(S)));

  type := NewType(fam,
                  IsEquivalenceRelation
                  and IsEquivalenceRelationDefaultRep
                  and IsGreensHStarRelation);

  rel := Objectify(type, rec());

  SetSource(rel, S);
  SetRange(rel, S);

  #SetIsSemigroupCongruence(rel, true);
  return rel;
end);


InstallMethod(GreensDStarRelation, "for a semigroup",
[IsSemigroup],
function(S)
  local fam, type, rel;

  fam := GeneralMappingsFamily(ElementsFamily(FamilyObj(S)),
                               ElementsFamily(FamilyObj(S)));

  type := NewType(fam,
                  IsEquivalenceRelation
                  and IsEquivalenceRelationDefaultRep
                  and IsGreensDStarRelation);

  rel := Objectify(type, rec());

  SetSource(rel, S);
  SetRange(rel, S);

  #SetIsSemigroupCongruence(rel, true);
  return rel;
end);


InstallMethod(GreensJStarRelation, "for a semigroup",
[IsSemigroup],
function(S)
  local fam, type, rel;

  fam := GeneralMappingsFamily(ElementsFamily(FamilyObj(S)),
                               ElementsFamily(FamilyObj(S)));

  type := NewType(fam,
                  IsEquivalenceRelation
                  and IsEquivalenceRelationDefaultRep
                  and IsGreensJStarRelation);

  rel := Objectify(type, rec());

  SetSource(rel, S);
  SetRange(rel, S);

  #SetIsSemigroupCongruence(rel, true);
  return rel;
end);


#GreensXClassType---------------------------------------------------------------


InstallMethod(GreensRStarClassType,
"for a semigroup",
[IsSemigroup],
function(S)
  return NewType(FamilyObj(S), IsEquivalenceClassDefaultRep
                               and IsGreensRStarClass);
end);


InstallMethod(GreensLStarClassType,
"for a semigroup",
[IsSemigroup],
function(S)
  return NewType(FamilyObj(S), IsEquivalenceClassDefaultRep
                               and IsGreensLStarClass);
end);


InstallMethod(GreensHStarClassType,
"for a semigroup",
[IsSemigroup],
function(S)
  return NewType(FamilyObj(S), IsEquivalenceClassDefaultRep
                               and IsGreensHStarClass);
end);


InstallMethod(GreensDStarClassType,
"for a semigroup",
[IsSemigroup],
function(S)
  return NewType(FamilyObj(S), IsEquivalenceClassDefaultRep
                               and IsGreensDStarClass);
end);

InstallMethod(GreensJStarClassType,
"for a semigroup",
[IsSemigroup],
function(S)
  return NewType(FamilyObj(S), IsEquivalenceClassDefaultRep
                               and IsGreensJStarClass);
end);


#EquivalenceClassOfElement------------------------------------------------------


InstallMethod(EquivalenceClassOfElement, 
"for a Green's *-relation and multiplicative element",
[IsGreensStarRelation, IsMultiplicativeElement], 
function(rel, x)
  local out, type;

  if not x in Source(rel) then 
    ErrorNoReturn("TODO");
  fi;

  out := rec();
  if IsGreensRStarRelation(rel) then 
    type := GreensRStarClassType(Source(rel));
  elif IsGreensLStarRelation(rel) then 
    type := GreensLStarClassType(Source(rel));
  elif IsGreensHStarRelation(rel) then 
    type := GreensHStarClassType(Source(rel));
  elif IsGreensDStarRelation(rel) then 
    type := GreensDStarClassType(Source(rel));
  elif IsGreensJStarRelation(rel) then 
    type := GreensJStarClassType(Source(rel));
  else
    ErrorNoReturn("TODO");
  fi;

  ObjectifyWithAttributes(out, type, 
                          EquivalenceClassRelation, rel,
                          Representative, x, 
                          ParentAttr, Source(rel));
  return out;
end);


#GreensXStarClass---------------------------------------------------------------


InstallMethod(GreensRStarClass, 
"for a semigroup and a multiplicative element", 
[IsSemigroup, IsMultiplicativeElement], 
function(S, x)
  return EquivalenceClassOfElement(GreensRStarRelation(S), x);
end);
 

InstallMethod(GreensLStarClass, 
"for a semigroup and a multiplicative element", 
[IsSemigroup, IsMultiplicativeElement], 
function(S, x)
  return EquivalenceClassOfElement(GreensLStarRelation(S), x);
end);


InstallMethod(GreensHStarClass, 
"for a semigroup and a multiplicative element", 
[IsSemigroup, IsMultiplicativeElement], 
function(S, x)
  return EquivalenceClassOfElement(GreensHStarRelation(S), x);
end);


InstallMethod(GreensDStarClass, 
"for a semigroup and a multiplicative element", 
[IsSemigroup, IsMultiplicativeElement], 
function(S, x)
  return EquivalenceClassOfElement(GreensDStarRelation(S), x);
end);


InstallMethod(GreensJStarClass, 
"for a semigroup and a multiplicative element", 
[IsSemigroup, IsMultiplicativeElement], 
function(S, x)
  return EquivalenceClassOfElement(GreensJStarRelation(S), x);
end);


#GreensXStarClasses-------------------------------------------------------------


# Q_JDM:
# These functions previously returned lists of element indices (see
# commented-out lines). I changed the return lines to return a list of *-classes
# elements. Is that what we want?

# Q_JDM:
# You haven't seen my GreensHStarClasses method yet. Look reasonable to you?

# Q_JDM:
# These functions were to take semigroups right? (question prompted by a
# another to do with XStarClassReps - see below)


InstallMethod(GreensRStarClasses, "for a semigroup",
[IsSemigroup],
function(S)
  local n, elms, kers, classes, i, ker, pos;

  n := DegreeOfTransformationSemigroup(S);
  elms := AsListCanonical(S);
  kers := [];
  classes := [];
  for i in [1 .. Size(S)] do
    ker := KernelOfTransformation(elms[i], n);
    pos := Position(kers, ker);
    if pos = fail then
      Add(kers, ker);
      Add(classes, [i]);
    else
      Add(classes[pos], i);
    fi;
  od;
  # PREV: return SortedList(classes);
  return List(classes, index_list -> GreensRStarClass(S, elms[index_list[1]]));
end);


InstallMethod(GreensLStarClasses, "for a semigroup",
[IsSemigroup],
function(S)
  local n, elms, images, classes, i, image, pos;

  n := DegreeOfTransformationSemigroup(S);
  elms := AsListCanonical(S);
  images := [];
  classes := [];
  for i in [1 .. Size(S)] do
    image := ImageSetOfTransformation(elms[i], n);
    pos := Position(images, image);    
    if pos = fail then
      Add(images, image);
      Add(classes, [i]);
    else
      Add(classes[pos], i);
    fi;
  od;
  # PREV: return SortedList(classes);
  return List(classes, index_list -> GreensLStarClass(S, elms[index_list[1]]));
end);


InstallMethod(GreensHStarClasses, "for a semigroup",
[IsSemigroup],
function(S)
  local n, elms, kers_and_images, classes, i, ker, image, pos;

  n := DegreeOfTransformationSemigroup(S);
  elms := AsListCanonical(S);
  kers_and_images := [];
  classes := [];
  for i in [1 .. Size(S)] do
    ker := KernelOfTransformation(elms[i], n);
    image := ImageSetOfTransformation(elms[i], n);
    pos := Position(kers_and_images, [ker, image]);
    if pos = fail then
      Add(kers_and_images, [ker, image]);
      Add(classes, [i]);
    else
      Add(classes[pos], i);
    fi;
  od;
  # PREV: return SortedList(classes);
  return List(classes, index_list -> GreensHStarClass(S, elms[index_list[1]]));
end);


#GreensXClasses-----------------------------------------------------------------


InstallMethod(GreensRClasses, "for a Green's R*-class",
[IsGreensRStarClass], 
function(R)  
  local n;
  n := DegreeOfTransformationSemigroup(Parent(R));
  return Filtered(GreensRClasses(Parent(R)),
                  C -> 
		  KernelOfTransformation(Representative(C), n) =
                  KernelOfTransformation(Representative(R), n));
end);


InstallMethod(GreensLClasses, "for a Green's L*-class",
[IsGreensLStarClass], 
function(L)
  local n;
  n := DegreeOfTransformationSemigroup(Parent(L));
  return Filtered(GreensLClasses(Parent(L)),
                  C -> 
		  ImageSetOfTransformation(Representative(C), n) =
                  ImageSetOfTransformation(Representative(L), n));
end);


InstallMethod(GreensHClasses, "for a Green's H*-class",
[IsGreensHStarClass],
function(H)
  local R, L, n;
  
  R := GreensRStarClass(Parent(H), Representative(H));
  L := GreensLStarClass(Parent(H), Representative(H));
  n := DegreeOfTransformationSemigroup(Parent(H));

  return Filtered(GreensHClasses(Parent(H)), 
		  C -> 
		  KernelOfTransformation(Representative(C), n) =
                  KernelOfTransformation(Representative(R), n) and \
		  ImageSetOfTransformation(Representative(C), n) =
                  ImageSetOfTransformation(Representative(L), n));
end);


#XClassesOfHStarClass-----------------------------------------------------------


# Q_JDM:
# Have I got these right? I have Elements(H) instead of simply H in the return
# line to stop ImagesElm related messages.


InstallMethod(RClassesOfHStarClass, "for an H*-class",
[IsGreensHStarClass],
function(H)
  return Union(List(Elements(H), 
	       h -> GreensRClasses(GreensRStarClass(Parent(H), h))));
end);


InstallMethod(LClassesOfHStarClass, "for an H*-class",
[IsGreensHStarClass],
function(H)
  return Union(List(Elements(H), 
	       h -> GreensLClasses(GreensLStarClass(Parent(H), h))));
end);


#XStarClassOfHStarClasses-------------------------------------------------------


# Q_JDM:
# Have I got these right?


InstallMethod(RStarOfHStarClass, "for an H*-class",
[IsGreensHStarClass],
function(H)
  return GreensRStarClass(Parent(H), Random(H));
end);


InstallMethod(LStarOfHStarClass, "for an H*-class",
[IsGreensHStarClass],
function(H)
  return GreensLStarClass(Parent(H), Random(H));
end);


#XStarClassReps-----------------------------------------------------------------


# Q_JDM:

# Before our last meeting this method was like so...

#InstallMethod(RClassReps, "for a Green's R*-class",
#[IsGreensRStarClass],
#function(R)
#  return List(GreensRClasses(R), C -> Representative(C));
#end);

# We changed it then to look like this...

#InstallMethod(RStarClassReps, "for a Green's R*-class",
#[IsGreensRStarClass],
#function(R)
#  return List(GreensRStarClasses(R), C -> Representative(C));
#end);

# However, our GreensXStarClasses method takes a semigroup, not a *-class. I've
# done it as per our alteration, but taking a semigroup instead of class. Please
# advise if we need something different. I'd thought that if it took a *-class,
# then there would only ever be one *-class representative and it could be any
# of its elements which is maybe not that profound.


InstallMethod(RStarClassReps, "for a semigroup",
[IsSemigroup],
function(S)
  return List(GreensRStarClasses(S), C -> Representative(C));
end);


InstallMethod(LStarClassReps, "for a semigroup",
[IsSemigroup],
function(S)
  return List(GreensLStarClasses(S), C -> Representative(C));
end);


InstallMethod(HStarClassReps, "for a semigroup",
[IsSemigroup],
function(S)
  return List(GreensHStarClasses(S), C -> Representative(C));
end);

#NrXStarClasses-----------------------------------------------------------------

# Q_JDM:

# (similar to question above)

# My original method looked like this...

#InstallMethod(NrRClasses, "for a Green's R*-class",
#[IsGreensRStarClass],
#function(R)
#  return Length(GreensRStarClasses(R));
#end);

# We changed it to look like this...

#InstallMethod(NrRStarClasses, "for a Green's R*-class",
#[IsGreensRStarClass],
#function(R)
#  return Length(GreensRStarClasses(R));
#end);

# I'm not sure if it should take a semigroup of *-class (as aove with 
# XStarClassReps).


InstallMethod(NrRStarClasses, "for a Green's R*-class",
[IsSemigroup],
function(S)
  return Length(GreensRStarClasses(S));
end);


InstallMethod(NrLStarClasses, "for a Green's L*-class",
[IsSemigroup],
function(S)
  return Length(GreensLStarClasses(S));
end);


InstallMethod(NrHStarClasses, "for a Green's H*-class",
[IsSemigroup],
function(S)
  return Length(GreensHStarClasses(S));
end);


#NrIdempotents------------------------------------------------------------------


InstallMethod(NrIdempotents, "for a Greens's R*-class",
[IsGreensRStarClass],
function(R)
  return Sum(List(GreensRClasses(R), C -> NrIdempotents(C)));  
end);


InstallMethod(NrIdempotents, "for a Greens's L*-class",
[IsGreensLStarClass],
function(L)
  return Sum(List(GreensLClasses(L), C -> NrIdempotents(C)));  
end);


InstallMethod(NrIdempotents, "for a Green's H*-class",
[IsGreensHStarClass],
function(H)
  return Sum(List(GreensHClasses(H), C -> NrIdempotents(C)));
end);


#Idempotents--------------------------------------------------------------------


InstallMethod(Idempotents, "for a Green's R*-class",
[IsGreensRStarClass],
function(R)
  return Concatenation(List(GreensRClasses(R), C -> Idempotents(C)));
end);


InstallMethod(Idempotents, "for a Green's L*-class",
[IsGreensLStarClass],
function(L)
  return Concatenation(List(GreensLClasses(L), C -> Idempotents(C)));
end);


InstallMethod(Idempotents, "for a Green's H*-class",
[IsGreensHStarClass],
function(H)
  return Concatenation(List(GreensHClasses(H), C -> Idempotents(C)));
end);


#Size--------------------------------------------------------------------------


InstallMethod(Size, "for a Greens R*-class",
[IsGreensRStarClass],
function(R)
  return Sum(List(GreensRClasses(R), C -> Size(C)));
end);


InstallMethod(Size, "for a Greens L*-class",
[IsGreensLStarClass],
function(L)
  return Sum(List(GreensLClasses(L), C -> Size(C)));
end);


InstallMethod(Size, "for a Greens H*-class",
[IsGreensHStarClass],
function(H)
  return Sum(List(GreensHClasses(H), C -> Size(C)));
end);


#AsSortedList-------------------------------------------------------------------


InstallMethod(AsSSortedList, "for a Green's R*-class",
[IsGreensRStarClass],
function(R)
  return Set(Concatenation(List(GreensRClasses(R), C -> Elements(C))));
end);


InstallMethod(AsSSortedList, "for a Green's L*-class",
[IsGreensLStarClass],
function(L)
  return Set(Concatenation(List(GreensLClasses(L), C -> Elements(C))));
end);


InstallMethod(AsSSortedList, "for a Green's H*-class",
[IsGreensHStarClass],
function(H)
  return Set(Concatenation(List(GreensHClasses(H), C -> Elements(C))));
end);


#-------------------------------------------------------------------------------


# Q_JDM:

# On D* relations, if I understood correctly, we'd discussed a definition of D*
# valid if R* and L* commute. I don't think they commute in general (I didn't 
# see it mentioned in Fountain's papers, though Shum - for what it's worth - 
# says they don't generally). I'm trying to establish what the case is 
# for finite / transformation semigroups. 

# I'm still not entirely sure what D*, the join, is. If the meet is the 
# intersection of R* and L* and their greatest lower bound, then why isn't the 
# join their union and so their least upper bound? (I've seen the meet and join
# defined as the least upper bound and greatest lower bound respectively - is 
# this the wrong way to look at it?).

# I'm also looking into whether D* = J* in finite semigroups (it is the case
# with D and J right?).

# I'd be grateful for your thoughts.


##==============================================================================
## IsAbundantSemigroup
## IsAdequateSemigroup
## IsSuperAbundantSemigroup
##==============================================================================

InstallMethod(IsAbundantSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  local x;

  x := Random(S);
  return (ForAll(GreensRStarClasses(S), C -> NrIdempotents(C) > 0) and \
	  ForAll(GreensLStarClasses(S), C -> NrIdempotents(C) > 0));
end);


InstallMethod(IsAdequateSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  local idemps, e;
  
  idemps := Idempotents(S);
  return (ForAll(idemps, e -> (e * idemps = idemps * e)) and \
	  IsAbundantSemigroup(S));
end);


InstallMethod(IsSuperabundantSemigroup, "for a semigroup",
[IsSemigroup],
function(S)

  return ForAll(GreensHStarClasses(S), C -> NrIdempotents(C) > 0);	
end);
