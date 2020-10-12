import React from "react";
import Scrollspy from "react-scrollspy";
import "./index.scss";

const Home = () => {
  const baseUrl = "https://localhost:3000/";
  return (
    <div className="container-fluid">
      <div className="row">
        <div className="col-sm-12 col-md-2 col-lg-2">
          <Scrollspy
            className="scrollspy"
            items={[
              "About",
              "API Endpoints",
              "All",
              "Name",
              "Origin",
              "Region",
              "Maker",
              "Response Example",
              "License",
            ]}
            currentClassName="is-current"
          >
            <li>
              <a href="#About">About</a>
            </li>
            <li>
              <a href="#section-2">section 2</a>
            </li>
            <li>
              <a href="#section-3">section 3</a>
            </li>
          </Scrollspy>
        </div>
        <div className="col-sm-12 col-md-8 col-lg-8">
          <section id="About">
            <h2>ABOUT</h2>
            <p>
              Get information about wines via a RESTful api in Portuguese. The
              main purpose of this project is to facilitate the creation of
              digital solutions so as to innovate and further propel the
              portuguese wine industry.
            </p>
          </section>
          <section id="API Endpoints">
            <h2>API ENDPOINTS</h2>
            <p>
              Below are described the REST endpoints available that you can use
              to search for countries
            </p>
          </section>
          <section id="All">
            <h2>ALL</h2>
            <pre>
              <code>{baseUrl}api/v1/wines</code>
            </pre>
          </section>
          <section id="name">
            <h2>NAME</h2>
            <p>
              Search wines by name. It can be a partial name.
            </p>
            <pre>
              <code>
                {baseUrl}api/v1/wines/name/{`{name}`}
              </code>
            </pre>
          </section>
          <section id="origin">section 3</section>
          <section id="section-3">section 3</section>
        </div>
      </div>
    </div>
  );
};

export default Home;
