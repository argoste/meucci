<?php
require_once("common.php");
$page_title = "Progettazione del Database Meucci";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/base.css">
    <title>Progettazione del Database Meucci</title>
  </head>
  <body>
    <h1>Progettazione del Database Meucci</h1>
    <p>Come si progetta una base di dati? Un esempio é quello della
     Biblioteca Fittizia Meucci. Ho progettato database subito
    dopo aver studiato un po' di teoria delle basi di dati (forme normali di
    Codd, ecc). Con le dovute modifiche puó essere la base per Pergamos.</p>
    
    <h2>Analisi dei dati </h2>
    <p>La biblioteca A. Meucci possiede solo di libri di argomento tecnico e 
scientifico. Di alcuni libri dispone di piú copie. 
</p>
    <p>Nel patrimonio sono confluite opere per le scuole superiori, opere di
    livello universitario, manuali vari
Le opere sono classificate secondo un sistema a faccette (etichette o tag), per
disciplina 
(una o piú), argomento (uno o piú), autori, lingua originale, lingua
disponibile, data di 
pubblicazione, paese di prima pubblicazione, numero di pagine (z). </p>
    <p>Alcune opere sono in piú volumi. Alcune opere formano delle collane.</p>
    <p>Gli scaffali hanno un numero progressivo, una stanza, un piano.</p>
    <h2>Analisi delle funzioni</h2>
    <p>Gli utenti ammessi al prestito possiedono una tessera, e possono
    prendere in prestito un 
massimo di tre libri per una settimana.</p>
    <p>Bisogna modellare anche l'acquisizione di nuove opere e la
    riorganizzazione di quelle 
esistenti, che in passato é avvenuta ogni cinque anni circa.</p>
    <p>I vincoli sono la formalizzazione di ció che possiamo dire a prescindere
    sui dati che 
andranno inseriti nella nostra base di dati, affinché abbiano senso. Non vuol
dire 
che corrispondano alla realtá dei fatti.</p>
    <div>V1: ( Noleggiare.DataFine &gt; Noleggiare.DataInizio )</div>
    <div>Utente é ammesso al prestito se e solo se il numero di libri che ha
    preso é minore o 
uguale a 2</div>
    <div>Una Copia é prestabile se e solo se DataAcquisizione é minore di
    DataAttuale</div>
  
    <h2>Conceptual model using UML</h2>
    <div>
      <img src="UML_Classes.png" alt="UML class diagram"></img>
    </div>
 
    <h2>The SQL DDL statements used</h2>
    
    <p>Datatypes are <code>NULL</code>, <code>INTEGER</code>,
    <code>REAL</code>, <code>TEXT</code>, or <code>BLOB</code>.</p>
    <p>For dates I'm using <code>TEXT</code> in this form
    <code>&quot;YYYY-MM-DD&quot;</code></p>
    
    <pre>
      <!-- the pre tag marks a text in which witespaces are to be rendered as
      they are, while the code tag marks a text as being code; -->
      <code class="language-sql">
--Using SQL as DDL := Data Definition Language
-- encoding utf8;   For MySQL v5.5
create database Meucci
    character set utf8;
use Meucci;
create table PublishedBook 
    (
    ISBN int not null,
    Title char not null,
    PubYear year check(PubYear &gt;= year(now())),
    Publisher char,
    AuthorID int,
    primary key (ISBN),
    foreign key (AuthorID) references Author (AuthorID)
    );
create table OwnedBook
    (
    Inventory int not null auto_increment,
    ISBN int not null,
    ShelfNum int not null,
    PurchaseDate date,
    PurchaseCost int,
    Loan int,
    primary key (Inventory),
    foreign key (ISBN) references PublishedBook (ISBN),
    foreign key (ShelfNum) references Shelf (ShelfNum),
    foreign key (Loan) references LibUser(ID)
    );
create table Author
    (
    AuthorID int not null auto_increment,
    FirstName char,
    Surname char not null,
    Birth year,
    Death year,
    primary key (AuthorID),
    check(Death &gt; Birth)
    );
create table Theme
    (
    Name char not null,
    primary key (Name)
    );
create table LibUser
    (
    UserID int not null,
    Name char not null,
    Surname char not null,
    Phone int not null,
    Address char not null,
    Good bit not null default 0,
    primary key (UserID)
    );
create table Shelf
    (
    ShelfNum int not null,
    Room int not null,
    primary key (ShelfNum)
    );
create table Loan
    (
    LoanID int not null,
    InvNum int not null,
    FromDate date not null,
    ToDate date not null,
    UserID int not null,
    primary key (LoanID),
    check(ToDate &gt; FromDate),
    foreign key (InvNum) references OwnedBook (InvNum),
    foreign key (UserID) references LibUser (UserID)
    );
create table Writing
    (
    AuthorID int not null,
    ISBN int not null
    );
create table Explaining
    (
    Theme char not null,
    ISBN int not null
    );
  </code>
</pre>
  </body>
</html>
