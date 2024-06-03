import React, { Component } from 'react';
import { Route, Routes } from 'react-router-dom';
import AppRoutes from './AppRoutes';
import { Layout } from './components/Layout';
import './custom.css';
import { ListaTareas } from './components/ListaTareas';

export default class App extends Component {
  static displayName = App.name;

  render() {
    return (
      <div>
        <ListaTareas /> 
      </div>
    );
  }
}
