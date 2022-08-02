package it.unicam.cs.CasottoIdS.models;

public class ParametriModifica {
    public double prezzo;
    public int posizione;
    public double prezzoLettini;
    public double prezzoSdraio;

   public ParametriModifica(double prezzo, int posizione, double prezzoLettini, double prezzoSdraio) {
       this.prezzo=prezzo;
       this.posizione=posizione;
       this.prezzoLettini=prezzoLettini;
       this.prezzoSdraio=prezzoSdraio;
   }


}
