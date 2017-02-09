# UML

UML 2.0 is a language for models. Useful for analysis,
design and documentation of a software project. It is a graphical language, i.e. you draw diagrams following some rules. There are many types of UML diagrams. They can be divided into **Structure diagrams** and **Behavior diagrams** ([more here](#all-diagrams)).  


An _object_ is something that exist or that we want to build.

A _class_ of objects is an abstraction. Is a template to make objects. It has attributes (aka properties) and methods, that are operations we can do on objects of that class. In other words methods are a way to describe the behavior of a class.

Relationship is a general term.

Two classes can be associated. A link is an instance of an association.

For example, the `Customer` is linked to `Product`.

Aggregation is putting together parts that form a whole.
Weak aggregation (an empty diamond).
Composition is a strong form of aggregation where parts only exist as parts of the whole.
(filled diamond).

Generalization: a subclass is related to a superclass. (It is represented as a empty triangle) it is the other way of seeing a inheritance.

Realization is  shown as a dashed line with triangular arrowhead. It connects the Implementation with its Specification (which is more abstract).

Dependency is shown as a dashed line with arrow.

> A dependency relationship represents that a model element relies on another model element for specification and/or implementation.
> visual-paradigm.com


A package is a way of grouping together classes giving them a namespace. It works like a folder in a filing system.


# All diagrams <a id="#all"></a>
All UML 2.0 diagrams. Explained using EBNF.

```
uml_diagram := structure_diagram | behavior_diagram ;
structure_diagram := "class diagram" | "compound-structure diagram"
    | "component diagram" | "deployment diagram" | "object diagram"
    | "package diagram" ;
behavior_diagram := "activity diagram" | "state-machine diagram"
    | "use-case diagram" | interaction_diagram ;
interaction_diagram := "communication diagram" | "interaction-overview diagram"
    | "sequence diagram" | "timing diagram" ;
```
Explained using a diagram.

```plantuml
left to right direction
scale 3/4
title All UML 2 diagrams : Class Diagram
UmlDiagram <|-- StructureDiagram
UmlDiagram <|-- BehaviorDiagram
StructureDiagram <|-- ClassDiagram
StructureDiagram <|-- Compound_StructureDiagram
StructureDiagram <|-- ComponentDiagram
StructureDiagram <|-- DeploymentDiagram
StructureDiagram <|-- ObjectDiagram
StructureDiagram <|-- PackageDiagram
BehaviorDiagram <|-- ActivityDiagram
BehaviorDiagram <|--  StateMachineDiagram
BehaviorDiagram <|--  UseCaseDiagram
BehaviorDiagram <|--  InteractionDiagram
InteractionDiagram <|-- CommunicationDiagram
InteractionDiagram <|-- InteractionoverviewDiagram
InteractionDiagram <|-- SequenceDiagram
InteractionDiagram <|-- TimingDiagram
```
