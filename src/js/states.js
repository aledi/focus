'use strict';

var arrEstadosMunicipios = {};

var stateName = {
    'AGS': 'Aguascalientes',
    'BC': 'Baja California',
    'BCS': 'Baja California Sur',
    'CAMP': 'Campeche',
    'COAH': 'Coahuila de Zaragoza',
    'COL': 'Colima',
    'CHIS': 'Chiapas',
    'CDMX': 'Ciudad de México',
    'DGO': 'Durango',
    'GTO': 'Guanajuato',
    'HGO': 'Hidalgo',
    'JAL': 'Jalisco',
    'EDOMEX': 'Estado de México',
    'MICH': 'Michoacán de Ocampo',
    'MOR': 'Morelos',
    'NAY': 'Nayarit',
    'NL': 'Nuevo León',
    'OAX': 'Oaxaca',
    'PUE': 'Puebla',
    'QRO': 'Querétaro',
    'QROO': 'Quintana Roo',
    'SLP': 'San Luis Potosí',
    'SIN': 'Sinaloa',
    'TAB': 'Tabasco',
    'TAM': 'Tamaulipas',
    'TLAX': 'Tlaxcala',
    'VER': 'Veracruz de Ignacio de la Llave',
    'YUC': 'Yucatán',
    'ZAC': 'Zacatecas'
}

function stateShortName(state) {
    switch(state) {
        case 'Aguascalientes':
            return 'AGS';
        case 'Baja California':
            return 'BC';
        case 'Baja California Sur':
            return 'BCS';
        case 'Campeche':
            return 'CAMP';
        case 'Coahuila de Zaragoza':
            return 'COAH';
        case 'Colima':
            return 'COL';
        case 'Chiapas':
            return 'CHIS';
        case 'Chihuahua':
            return 'CHI';
        case 'Ciudad de México':
            return 'CDMX';
        case 'Durango':
            return 'DGO';
        case 'Guanajuato':
            return 'GTO';
        case 'Guerrero':
            return 'GRO';
        case 'Hidalgo':
            return 'HGO';
        case 'Jalisco':
            return 'JAL';
        case 'México':
            return 'EDOMEX';
        case 'Michoacán de Ocampo':
            return 'MICH';
        case 'Morelos':
            return 'MOR';
        case 'Nayarit':
            return 'NAY';
        case 'Nuevo León':
            return 'NL';
        case 'Oaxaca':
            return 'OAX';
        case 'Puebla':
            return 'PUE';
        case 'Querétaro':
            return 'QRO';
        case 'Quintana Roo':
            return 'QROO';
        case 'San Luis Potosí':
            return 'SLP';
        case 'Sinaloa':
            return 'SIN';
        case 'Sonora':
            return 'SON';
        case 'Tabasco':
            return 'TAB';
        case 'Tamaulipas':
            return 'TAM';
        case 'Tlaxcala':
            return 'TLAX';
        case 'Veracruz de Ignacio de la Llave':
            return 'VER';
        case 'Yucatán':
            return 'YUC';
        case 'Zacatecas':
            return 'ZAC';
    }
}
