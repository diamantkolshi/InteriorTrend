import React from 'react';

const Layout = ({children}) => {
  return (
    <>
      {children}
    </>
  )
}

export default page => <Layout>{page}</Layout>;
