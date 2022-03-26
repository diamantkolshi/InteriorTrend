import React, { useEffect } from 'react';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { usePage } from '@inertiajs/inertia-react'
import { toast } from 'react-toastify';

const Layout = ({children}) => {
  const { message } = usePage()

  useEffect(() => {
    if(message) {
      toast.info(message)
    }
  }, message)

  return (
    <>
      <ToastContainer
        position="top-center"
      />
      {children}
    </>
  )
}

export default Layout;
