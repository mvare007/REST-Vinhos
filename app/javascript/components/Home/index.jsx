import React from "react";
import Scrollspy from "react-scrollspy";
import "./index.scss";

const Home = () => {
  const baseUrl = "https://restvinhos.herokuapp.com/";
  return (
    <div className="container-fluid">
      <div className="row">
        <div className="col-sm-12 col-md-2 col-lg-2">
          <Scrollspy
            className="scrollspy"
            items={[
              "about",
              "endpoints",
              "all",
              "name",
              "country",
              "region",
              "maker",
              "by-id",
              "response-example",
              "contribute",
              "license",
            ]}
            currentClassName="is-current"
          >
            <li className="font-weight-bold">
              <a href="#about">ABOUT</a>
            </li>
            <li className="font-weight-bold">
              <a href="#endpoints">API ENDPOINTS</a>
            </li>
            <li>
              <a href="#all">ALL</a>
            </li>
            <li>
              <a href="#name">NAME</a>
            </li>
            <li>
              <a href="#country">COUNTRY</a>
            </li>
            <li>
              <a href="#region">REGION</a>
            </li>
            <li>
              <a href="#maker">WINEMAKER</a>
            </li>
            <li>
              <a href="#by-id">BY ID</a>
            </li>
            <li className="font-weight-bold">
              <a href="#response-example">RESPONSE EXAMPLE</a>
            </li>
            <li className="font-weight-bold">
              <a href="#contribute">CONTRIBUTE</a>
            </li>
            <li className="font-weight-bold">
              <a href="#license">LICENSE</a>
            </li>
          </Scrollspy>
        </div>
        <div className="col-sm-12 col-md-8 col-lg-8">
          <section id="about">
            <h2>ABOUT</h2>
            <p>
              Get data on over 3200 wines via a RESTful api in Portuguese. All
              the data was obtained by scraping. The main purpose of
              this project is to facilitate the creation of digital solutions by
              any developer so as to innovate and further propel the portuguese
              wine industry.
            </p>
          </section>
          <section id="endpoints">
            <h2>API ENDPOINTS</h2>
            <p>
              Below are described the REST endpoints available that you can use
              to search for wines.
            </p>
          </section>
          <section id="all">
            <h2>ALL</h2>
            <pre>
              <code>{baseUrl}api/v1/wines</code>
            </pre>
          </section>
          <section id="name">
            <h2>NAME</h2>
            <p>Search wines by name. It can be a partial name.</p>
            <pre>
              <code>
                {baseUrl}api/v1/wines/name/{`{name}`}
              </code>
            </pre>
          </section>
          <section id="country">
            <h2>COUNTRY</h2>
            <p>Search wines by country.</p>
            <pre>
              <code>
                {baseUrl}api/v1/wines/country/{`{country}`}
              </code>
            </pre>
          </section>
          <section id="region">
            <h2>REGION</h2>
            <p>Search wines by region. It can be a partial name.</p>
            <pre>
              <code>
                {baseUrl}api/v1/wines/region/{`{region}`}
              </code>
            </pre>
          </section>
          <section id="maker">
            <h2>WINEMAKER</h2>
            <p>Search wines by maker. It can be a partial name.</p>
            <pre>
              <code>
                {baseUrl}api/v1/wines/maker/{`{maker}`}
              </code>
            </pre>
          </section>
          <section id="by-id">
            <h2>BY ID</h2>
            <p>Search wines by the id number.</p>
            <pre>
              <code>
                {baseUrl}api/v1/wines/{`{:id}`}
              </code>
            </pre>
          </section>
          <section id="response-example">
            <h2>RESPONSE EXAMPLE</h2>
            <pre>
              <code>{baseUrl}api/v1/wines/1400</code>
            </pre>
            <pre id="response">
              <code>
                {`
                {
                   "id":1400,
                   "name":"2017 Quinta Nova de Nossa Senhora do Carmo Mirabilis tinto",
                   "description":"A Quinta Nova de Nossa Senhora do Carmo é um local de extrema beleza, no coração do Douro, e propriedade da família Amorim desde 1999. A ligação da família ao vinho vem de longe, através da sua ligação às casas exportadoras de Vila Nova de Gaia, por via do negócio da cortiça, mas nessa data esta ligação resultou na concretização de um sonho e o projecto está hoje nas mãos da 4ª geração da família. Com uma história superior a 250 anos, a quinta exibe uma traça conservada e o edifício original da adega de 1764, após intervenções a cargo do Arquitecto Arnaldo Barbosa.",
                   "image_url":"http://res.cloudinary.com/dhlnraejo/image/upload/n0alkwfpmks3ytt8qfnjjmwyp4dt",
                   "variant":"Tinto",
                   "country":"Portugal",
                   "region":"Douro",
                   "volume":14.0,
                   "maker":"Quinta Nova"
                }`}
              </code>
            </pre>
          </section>
          <section id="contribute">
            <h2>CONTRIBUTE</h2>
            <a href="/requests/new">Contribute by adding more wine data to the api.</a>
          </section>
          <section id="license">
            <h2>LICENSE</h2>
            <a href="https://www.mozilla.org/en-US/MPL/2.0/">
              Mozilla Public License
            </a>{" "}
            MPL 2.0
          </section>
        </div>
      </div>
    </div>
  );
};

export default Home;
