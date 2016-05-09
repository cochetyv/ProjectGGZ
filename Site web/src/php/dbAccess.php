<?php
/*
Author : Yvan Cochet
Date : 09.05.2016
Summary : Class to access the db
*/


//FUNCTION HEADER
/// <summary>
/// :summary:
/// </summary>
/// <param name=":paramName:">:description</param>

class dbAccess{
	
	//Var with connection to database
    private $db;

    //FUNCTION HEADER
    /// <summary>
    /// Function to connect the database
    /// </summary>
    private function connectDB()
    {
        //Var to access db
        $login = 'root';
        $password = '';
        $host = 'localhost';
        $dbName = 'db_nickname';

        //Connection to the DB with UTF8
        $this->db = new PDO(sprintf('mysql:host=%s;dbname=%s', $host, $dbName), $login, $password, array( PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    }

    //FUNCTION HEADER
    /// <summary>
    /// Function to deconnect the database
    /// </summary>
    private function deconnectDB()
    {
        $this->db = null;
    }

    //FUNCTION HEADER
    /// <summary>
    /// Function that execute sql requests
    /// </summary>
    ///<param name="sqlRequest">Syntax of the sql request to execute</param>
    private function executeSqlRequest($sqlRequest)
    {
        $req = $this->db->prepare($sqlRequest);
        $req->execute();
        $datas = $req->fetchAll(PDO::FETCH_ASSOC);
        $req->closeCursor();

        return $datas;

    }
	
	
}

?>